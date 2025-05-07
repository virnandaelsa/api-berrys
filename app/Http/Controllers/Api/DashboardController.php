<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Absensi;
use App\Models\Jadwal;
use App\Models\Karyawan;
use App\Models\Pendapatan;
use App\Models\Penggajian;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    public function DashAdmin(Request $request)
    {
        // Hitung data karyawan
        $totalKaryawan = Karyawan::count(); // Total semua karyawan
        $karyawanAktif = Karyawan::where('status', 'Aktif')->count(); // Total karyawan aktif
        $karyawanTidakAktif = Karyawan::where('status', 'Tidak Aktif')->count(); // Total karyawan tidak aktif

        // Hitung total gaji bulanan
        $bulan = $request->query('bulan', now()->format('m'));
        $tahun = $request->query('tahun', now()->format('Y'));
        \Log::info("Menghitung total penggajian untuk Bulan: {$bulan}, Tahun: {$tahun}");

        $totalGaji = Penggajian::whereMonth('tanggal', $bulan)
            ->whereYear('tanggal', $tahun)
            ->sum('total_gaji');

        // Hitung jumlah karyawan masuk berdasarkan jadwal hari ini (distinct berdasarkan id_karyawan)
        $tanggal = $request->query('tanggal', now()->toDateString());
        \Log::info("Menghitung jumlah karyawan yang masuk pada tanggal: " . $tanggal);

        $jadwalHariIni = Jadwal::whereDate('date', $tanggal)
            ->join('karyawan', 'jadwal.id_karyawan', '=', 'karyawan.id')
            ->select('jadwal.id_karyawan')
            ->distinct() // Pastikan hanya menghitung karyawan unik
            ->get();

        $jumlahKaryawanMasuk = $jadwalHariIni->count();

        // Hitung jumlah karyawan yang melakukan absensi hari ini (distinct berdasarkan id_karyawan)
        $absensiHariIni = Absensi::whereDate('tanggal', $tanggal)
            ->join('karyawan', 'absensi.id_karyawan', '=', 'karyawan.id')
            ->select('absensi.id_karyawan')
            ->distinct() // Pastikan hanya menghitung karyawan unik
            ->get();

        $jumlahKaryawanAbsen = $absensiHariIni->count();

        return response()->json([
            'status' => 'success',
            'data' => [
                'total_karyawan' => $totalKaryawan,
                'karyawan_aktif' => $karyawanAktif,
                'karyawan_tidak_aktif' => $karyawanTidakAktif,
                'total_penggajian' => [
                    'bulan' => $bulan,
                    'tahun' => $tahun,
                    'total' => $totalGaji,
                ],
                'jumlah_karyawan_masuk' => [
                    'tanggal' => $tanggal,
                    'jumlah' => $jumlahKaryawanMasuk,
                ],
                'jumlah_karyawan_absen' => [
                    'tanggal' => $tanggal,
                    'jumlah' => $jumlahKaryawanAbsen,
                ],
            ],
        ], 200);
    }

    public function pendapatanTahunan(Request $request)
    {
        \Log::info('Masuk ke metode pendapatanTahunan');
        \Log::info('Data yang diterima:', $request->all());

        // Validasi input tahun
        $validated = $request->validate([
            'tahun' => 'required|integer|min:2000|max:' . now()->year,
        ]);

        $tahun = $validated['tahun'];
        \Log::info("Menghitung pendapatan tahunan untuk Tahun: $tahun");

        try {
            // Ambil pendapatan grup berdasarkan bulan
            $pendapatanPerBulan = Pendapatan::selectRaw('MONTH(tanggal) as bulan, SUM(omset_sistem) as total_pendapatan')
                ->whereYear('tanggal', $tahun)
                ->groupBy('bulan')
                ->orderBy('bulan')
                ->get();

            // Format data untuk grafik (0 untuk bulan tanpa pendapatan)
            $data = array_fill(1, 12, 0); // Isi nilai default 0 untuk 12 bulan
            foreach ($pendapatanPerBulan as $item) {
                $data[$item->bulan] = $item->total_pendapatan;
            }

            return response()->json([
                'status' => 'success',
                'message' => 'Pendapatan tahunan berhasil dihitung.',
                'data' => [
                    'tahun' => $tahun,
                    'pendapatan' => $data,
                ],
            ], 200);
        } catch (\Exception $e) {
            \Log::error('Terjadi error saat menghitung pendapatan tahunan:', ['error' => $e->getMessage()]);
            return response()->json([
                'status' => 'error',
                'message' => 'Terjadi error saat menghitung pendapatan tahunan.',
            ], 500);
        }
    }
}
