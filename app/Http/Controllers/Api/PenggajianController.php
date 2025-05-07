<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Karyawan;
use App\Models\Absensi;
use App\Models\Gaji;
use App\Models\Penggajian;
use App\Models\EditGaji;
use App\Models\RekapGajiBulanan;
use Carbon\Carbon;


class PenggajianController extends Controller
{
    /**
     * Simpan gaji harian dan hitung langsung untuk setiap karyawan.
     */
    public function simpanGajiHarian()
    {
        $tanggalHariIni = now()->toDateString(); // Mengambil tanggal hari ini
        $bulanSekarang = now()->format('m'); // Bulan
        $tahunSekarang = now()->format('Y'); // Tahun

        \Log::info("Mulai proses simpan gaji harian untuk tanggal: " . $tanggalHariIni);

        $karyawans = Karyawan::with('absensi')->get();
        $gajiData = Gaji::pluck('gaji', 'bagian'); // bagian => gaji per jam

        foreach ($karyawans as $karyawan) {
            \Log::info("Memproses karyawan: " . $karyawan->nama . " (Role: " . $karyawan->role . ")");

            $role = $karyawan->role;
            $gajiPerJam = $gajiData[$role] ?? null;

            if (!$gajiPerJam) {
                \Log::warning("Tidak ada gaji per jam untuk role: " . $role);
                continue;
            }

            $absensiHariIni = $karyawan->absensi->where('tanggal', $tanggalHariIni);
            \Log::info("Jumlah absensi hari ini: " . $absensiHariIni->count());

            if ($absensiHariIni->count() != 2) {
                \Log::warning("Absensi tidak lengkap untuk karyawan: " . $karyawan->nama);
                continue;
            }

            // Ambil absensi pertama (masuk) dan kedua (pulang)
            $masuk = \Carbon\Carbon::parse($absensiHariIni->first()->jam);  // Jam masuk
            $pulang = \Carbon\Carbon::parse($absensiHariIni->last()->jam); // Jam pulang

            $totalMenit = abs($pulang->diffInMinutes($masuk)); // Durasi dalam menit
            $totalJam = $totalMenit / 60;  // Konversi menit ke jam

            \Log::info("Jam masuk: " . $masuk->toTimeString() . ", Jam pulang: " . $pulang->toTimeString());
            \Log::info("Total jam kerja: " . $totalJam);

            $totalGaji = $totalJam * $gajiPerJam;

            $sudahAda = Penggajian::where('id_karyawan', $karyawan->id)
                        ->where('tanggal', $tanggalHariIni)
                        ->exists();

            if (!$sudahAda) {
                \Log::info("Menyimpan penggajian untuk " . $karyawan->nama);
                Penggajian::create([
                    'id_karyawan' => $karyawan->id,
                    'tanggal' => $tanggalHariIni,
                    'total_jam' => $totalJam,
                    'total_gaji' => $totalGaji,
                    'gaji_per_jam' => $gajiPerJam,
                ]);
            }

            // Update Rekap Gaji Bulanan
            $rekapGaji = RekapGajiBulanan::firstOrCreate(
                [
                    'id_karyawan' => $karyawan->id,
                    'bulan' => $bulanSekarang,
                    'tahun' => $tahunSekarang
                ],
                [
                    'total_gaji' => 0,
                    'total_jam' => 0,
                    'jumlah_hari_kerja' => 0
                ]
            );

            $rekapGaji->total_gaji += $totalGaji; // Tambahkan gaji harian ke total gaji bulanan
            $rekapGaji->total_jam += $totalJam; // Tambahkan jam kerja harian ke total jam kerja bulanan
            $rekapGaji->jumlah_hari_kerja += 1; // Tambahkan 1 hari kerja
            $rekapGaji->save();

            \Log::info("Rekap gaji bulanan diperbarui untuk karyawan: " . $karyawan->nama);
        }

        \Log::info("Selesai proses simpan gaji harian.");
        return response()->json(['success' => true, 'message' => 'Penggajian harian berhasil disimpan']);
    }
    /**
     * Menampilkan daftar penggajian untuk semua karyawan.
     */
    public function index(Request $request)
    {
        // Ambil parameter bulan dan tahun dari request
        $bulan = $request->query('bulan');
        $tahun = $request->query('tahun');

        // Query data RekapGajiBulanan dengan filter bulan dan tahun
        $rekap_gaji_bulanan = RekapGajiBulanan::with('karyawan')
            ->when($bulan, function ($query, $bulan) {
                return $query->where('bulan', $bulan);
            })
            ->when($tahun, function ($query, $tahun) {
                return $query->where('tahun', $tahun);
            })
            ->get();

        return response()->json($rekap_gaji_bulanan);
    }

    /**
     * Menampilkan penggajian berdasarkan karyawan.
     */
    public function showByKaryawan($id)
{
    $bulan = request()->query('bulan');
    $tahun = request()->query('tahun');

    \Log::info("Memulai fungsi showByKaryawan untuk ID: {$id}, Bulan: {$bulan}, Tahun: {$tahun}");

    try {
        // Ambil data RekapGajiBulanan untuk karyawan ini
        $rekapGajiBulanan = RekapGajiBulanan::with(['karyawan'])
            ->where('id_karyawan', $id)
            ->where('bulan', $bulan)
            ->where('tahun', $tahun)
            ->first();

        if (!$rekapGajiBulanan) {
            return response()->json(['error' => 'Data penggajian tidak ditemukan.'], 404);
        }

        // Ambil semua data EditGaji untuk karyawan ini berdasarkan bulan dan tahun
        $editGaji = EditGaji::where('id_karyawan', $id)
            ->where('bulan', $bulan)
            ->where('tahun', $tahun)
            ->get();

        // Hitung total bonus dan potongan
        $totalBonus = $editGaji->where('jenis', 'bonus')->sum('jumlah');
        $totalPotongan = $editGaji->where('jenis', 'potongan')->sum('jumlah');

        // Sertakan data bonus dan potongan dalam respons
        return response()->json([
            'karyawan' => $rekapGajiBulanan->karyawan,
            'rekap' => [
                'bulan' => $rekapGajiBulanan->bulan,
                'tahun' => $rekapGajiBulanan->tahun,
                'total_gaji' => $rekapGajiBulanan->total_gaji,
                'jumlah_hari_kerja' => $rekapGajiBulanan->jumlah_hari_kerja,
                'total_jam' => $rekapGajiBulanan->total_jam,
                'total_bonus' => $totalBonus,
                'total_potongan' => $totalPotongan,
                'edit_gaji' => $editGaji, // Semua data edit gaji
            ],
        ], 200);
    } catch (\Exception $e) {
        \Log::error("Terjadi kesalahan API: " . $e->getMessage());
        return response()->json(['error' => 'Terjadi kesalahan saat memuat data.'], 500);
    }
}

    public function getByMonthYear($id_karyawan, Request $request)
    {
        $bulan = $request->query('bulan');
        $tahun = $request->query('tahun');

        $data = Penggajian::where('id_karyawan', $id_karyawan)
            ->whereMonth('tanggal', $bulan)
            ->whereYear('tanggal', $tahun)
            ->get();

        $totalGaji = $data->sum('total_gaji');
        $totalJam = $data->sum('total_jam');
        $jumlahHariKerja = $data->count();

        // Cek jika ada bonus/potongan dari owner
        $edit = EditGaji::where('id_karyawan', $id_karyawan)
            ->where('bulan', $bulan)
            ->where('tahun', $tahun)
            ->get();

        // Menghitung total bonus/potongan dengan mempertimbangkan tanda (positif atau negatif)
        $totalTambahan = $edit->sum('jumlah');

        // Menambahkan atau mengurangi gaji sesuai bonus/potongan
        $totalGajiDenganEdit = $totalGaji + $totalTambahan;

        return response()->json([
            'total_gaji' => $totalGajiDenganEdit,
            'total_jam' => $totalJam,
            'jumlah_hari_kerja' => $jumlahHariKerja,
            'edit' => $edit,
            'detail' => $data
        ]);
    }

        public function formEditGaji($id_karyawan, $bulan, $tahun)
    {
        // Ambil data karyawan berdasarkan ID
        $karyawan = Karyawan::find($id_karyawan);

        if (!$karyawan) {
            return response()->json(['error' => 'Karyawan tidak ditemukan.'], 404);
        }

        // Struktur JSON yang akan dikirim
        return response()->json([
            'karyawan' => [
                'id' => $karyawan->id,
                'nama' => $karyawan->nama,
                'role' => $karyawan->role
            ],
            'bulan' => $bulan,
            'tahun' => $tahun,
        ]);
    }

    public function tambahEditGaji(Request $request)
    {
        $request->validate([
            'id_karyawan' => 'required',
            'jumlah' => 'required|integer',
            'jenis' => 'required|in:bonus,potongan',
            'keterangan' => 'required|string'
        ]);

        $bulan = $request->input('bulan', now()->format('m'));
        $tahun = $request->input('tahun', now()->format('Y'));

        $jumlah = $request->input('jumlah');
        if ($request->input('jenis') == 'potongan') {
            $jumlah = -abs($jumlah);
        }

        EditGaji::create([
            'id_karyawan' => $request->input('id_karyawan'),
            'bulan' => $bulan,
            'tahun' => $tahun,
            'jumlah' => $jumlah,
            'jenis' => $request->input('jenis'),
            'keterangan' => $request->input('keterangan')
        ]);

        // Update Rekap Gaji Bulanan
        $rekapGaji = RekapGajiBulanan::where('id_karyawan', $request->input('id_karyawan'))
            ->where('bulan', $bulan)
            ->where('tahun', $tahun)
            ->first();

        if ($rekapGaji) {
            $rekapGaji->total_gaji += $jumlah;
            $rekapGaji->save();
        }

        return response()->json(['message' => 'Bonus/Potongan berhasil ditambahkan']);
    }
}
