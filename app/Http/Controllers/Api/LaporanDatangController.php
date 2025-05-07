<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LaporanDatang;
use App\Models\Laporan;
use App\Models\StokDatang;
use App\Models\Pendapatan;
use App\Models\Jadwal;

class LaporanDatangController extends Controller
{
    public function laporan_datang(Request $request)
    {
        \Log::info('Masuk ke metode laporan_datang');
        \Log::info('Data yang diterima:', $request->all());

        // Validasi input
        try {
            $validated = $request->validate([
                'id_jadwal' => 'required|integer',
                'tanggal' => 'required|date',
                'donat_bombo' => 'required|integer',
                'donat_bolong' => 'required|integer',
                'donat_salju' => 'required|integer',
                'kelengkapan' => 'string|nullable',
                'catatan' => 'string|nullable',
            ]);
            \Log::info('Validasi berhasil:', $validated);
        } catch (\Illuminate\Validation\ValidationException $e) {
            \Log::error('Validasi gagal:', $e->errors());
            return response()->json([
                'status' => 'error',
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        }

        // Simpan data
        LaporanDatang::create($validated);
        \Log::info('Data berhasil disimpan ke database.');

        return response()->json([
            'status' => 'success',
            'message' => 'Data laporan berhasil disimpan!',
        ]);
    }

    public function stok_datang(Request $request)
    {
        \Log::info('Masuk ke metode stok_datang');
        \Log::info('Data yang diterima:', $request->all());

        // Validasi input
        try {
            $validated = $request->validate([
                'id_jadwal' => 'required|integer',
                'tanggal' => 'required|date',
                'donat_bombo' => 'required|integer',
                'donat_bolong' => 'required|integer',
                'donat_salju' => 'required|integer',
                'kelengkapan' => 'string|nullable',
                'catatan' => 'string|nullable',
            ]);
            \Log::info('Validasi berhasil:', $validated);
        } catch (\Illuminate\Validation\ValidationException $e) {
            \Log::error('Validasi gagal:', $e->errors());
            return response()->json([
                'status' => 'error',
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        }

        // Simpan data
        StokDatang::create($validated);
        \Log::info('Data berhasil disimpan ke database.');

        return response()->json([
            'status' => 'success',
            'message' => 'Data Stok berhasil disimpan!',
        ]);
    }

    public function laporan(Request $request)
    {
        \Log::info('Masuk ke metode laporan');
        \Log::info('Data yang diterima:', $request->all());

        try {
            $validatedData = $request->validate([
                'id_jadwal' => 'required|exists:jadwal,id',
                'tanggal' => 'required|date',
                'omset' => 'nullable|numeric',
                'fisik' => 'nullable|numeric',
                'pengeluaran' => 'nullable|numeric',
                'stok_bomboloni' => 'nullable|integer',
                'stok_bolong' => 'nullable|integer',
                'stok_salju' => 'nullable|integer',
                'kelengkapan' => 'nullable|string',
                'catatan' => 'nullable|string',
            ]);
            \Log::info('Validasi berhasil:', $validatedData);
        } catch (\Illuminate\Validation\ValidationException $e) {
            \Log::error('Validasi gagal:', $e->errors());
            return response()->json([
                'status' => 'error',
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
            ], 422);
        }

        // Simpan laporan akhir (laporan_pulang)
        $laporan = Laporan::create($validatedData);
        \Log::info('Data laporan berhasil disimpan ke database.');

        // Panggil metode hitungPendapatan setelah laporan kedua
        $pendapatan = $this->hitungPendapatanManual($validatedData);

        return response()->json([
            'success' => true,
            'message' => 'Laporan berhasil disimpan dan pendapatan telah dihitung!',
            'data' => [
                'laporan' => $laporan,
                'pendapatan' => $pendapatan,
            ],
        ], 201);
    }

    public function hitungPendapatanManual(array $validated)
{
    \Log::info('Memulai perhitungan pendapatan setelah laporan kedua');

    // Ambil data laporan awal
    $laporanAwal = LaporanDatang::where('id_jadwal', $validated['id_jadwal'])
        ->where('tanggal', '<=', $validated['tanggal'])
        ->orderBy('tanggal', 'asc')
        ->first();

    if (!$laporanAwal) {
        \Log::error('Laporan awal tidak ditemukan. Pendapatan tidak dapat dihitung.');
        return null;
    }

    // Ambil data stok datang (bisa lebih dari satu kali dalam sehari)
    $stokDatang = StokDatang::where('id_jadwal', $validated['id_jadwal'])
        ->where('tanggal', $validated['tanggal'])
        ->get();

    $stokDatangBombo = $stokDatang->sum('donat_bombo');
    $stokDatangBolong = $stokDatang->sum('donat_bolong');
    $stokDatangSalju = $stokDatang->sum('donat_salju');

    // Ambil data laporan akhir
    $laporanAkhir = Laporan::where('id_jadwal', $validated['id_jadwal'])
        ->where('tanggal', $validated['tanggal'])
        ->first();

    if (!$laporanAkhir) {
        \Log::error('Laporan akhir tidak ditemukan. Pendapatan tidak dapat dihitung.');
        return null;
    }

    // Ambil pengeluaran dari laporan akhir
    $pengeluaran = $laporanAkhir->pengeluaran ?? 0;

    // Perhitungan pendapatan masing-masing jenis donat
    $pendapatanBombo = (($laporanAwal->donat_bombo ?? 0) + $stokDatangBombo - ($laporanAkhir->stok_bomboloni ?? 0)) * 2500;
    $pendapatanBolong = (($laporanAwal->donat_bolong ?? 0) + $stokDatangBolong - ($laporanAkhir->stok_bolong ?? 0)) * 2000;
    $pendapatanSalju = (($laporanAwal->donat_salju ?? 0) + $stokDatangSalju - ($laporanAkhir->stok_salju ?? 0)) * 600;

    // Total pendapatan
    $totalPendapatan = $pendapatanBombo + $pendapatanBolong + $pendapatanSalju - $pengeluaran;

    \Log::info('Perhitungan pendapatan:', [
        'pendapatan_bombo' => $pendapatanBombo,
        'pendapatan_bolong' => $pendapatanBolong,
        'pendapatan_salju' => $pendapatanSalju,
        'total_pendapatan' => $totalPendapatan,
    ]);

    // Simpan pendapatan ke database
    $pendapatan = Pendapatan::create([
        'id_jadwal' => $validated['id_jadwal'],
        'tanggal' => $validated['tanggal'],
        'omset' => $validated['omset'] ?? null, // Inputan karyawan
        'omset_sistem' => $totalPendapatan,     // Hasil perhitungan sistem
        'fisik' => $validated['fisik'] ?? null,
        'pengeluaran' => $validated['pengeluaran'] ?? null,
    ]);

    \Log::info('Pendapatan berhasil disimpan ke database:', $pendapatan->toArray());

    return $pendapatan;
}

public function lihatLaporanDatang(Request $request)
{
    \Log::info('Masuk ke metode lihatLaporanDatang');
    \Log::info('Data yang diterima:', $request->all());

    try {
        // Validasi input
        $validated = $request->validate([
            'tanggal' => 'required|date',
        ]);
        \Log::info('Validasi berhasil:', $validated);

        // Ambil laporan datang
        $laporanDatang = LaporanDatang::where('tanggal', $validated['tanggal'])->get();
        \Log::info('Hasil kueri laporanDatang:', $laporanDatang->toArray());

        // Periksa apakah data ditemukan
        if ($laporanDatang->isEmpty()) {
            \Log::info('Laporan datang tidak ditemukan.');
            return response()->json([
                'status' => 'error',
                'message' => 'Tidak ada data laporan datang untuk tanggal ini.',
            ], 404);
        }

        // Kembalikan data jika ditemukan
        return response()->json([
            'status' => 'success',
            'message' => 'Laporan datang berhasil diambil.',
            'data' => $laporanDatang,
        ]);
    } catch (\Exception $e) {
        \Log::error('Terjadi error:', ['error' => $e->getMessage()]);
        return response()->json([
            'status' => 'error',
            'message' => 'Terjadi error saat memproses permintaan.',
        ], 500);
    }
}

public function lihatStokDatang(Request $request)
{
    \Log::info('Masuk ke metode lihatStokDatang');
    \Log::info('Data yang diterima:', $request->all());

    try {
        // Validasi input
        $validated = $request->validate([
            'tanggal' => 'required|date',
        ]);
        \Log::info('Validasi berhasil:', $validated);

        // Ambil stok datang
        $stokDatang = StokDatang::where('tanggal', $validated['tanggal'])->get();
        \Log::info('Hasil kueri stokDatang:', $stokDatang->toArray());

        // Periksa apakah data ditemukan
        if ($stokDatang->isEmpty()) {
            \Log::info('Stok datang tidak ditemukan.');
            return response()->json([
                'status' => 'error',
                'message' => 'Stok datang tidak ditemukan.',
            ], 404);
        }

        // Kembalikan data jika ditemukan
        return response()->json([
            'status' => 'success',
            'message' => 'Stok datang berhasil diambil.',
            'data' => $stokDatang,
        ]);
    } catch (\Exception $e) {
        \Log::error('Terjadi error di metode lihatStokDatang:', ['error' => $e->getMessage()]);
        return response()->json([
            'status' => 'error',
            'message' => 'Terjadi error saat memproses permintaan.',
        ], 500);
    }
}

public function lihatLaporanPulang(Request $request)
{
    \Log::info('Masuk ke metode lihatLaporanPulang');
    \Log::info('Data yang diterima:', $request->all());

    try {
        // Validasi input
        $validated = $request->validate([
            'tanggal' => 'required|date',
        ]);
        \Log::info('Validasi berhasil:', $validated);

        // Ambil laporan pulang
        $laporanPulang = Laporan::where('tanggal', $validated['tanggal'])->get();
        \Log::info('Hasil kueri laporanPulang:', $laporanPulang ? $laporanPulang->toArray() : null);

        // Periksa apakah data ditemukan
        if (!$laporanPulang) {
            \Log::info('Laporan pulang tidak ditemukan.');
            return response()->json([
                'status' => 'error',
                'message' => 'Laporan pulang tidak ditemukan.',
            ], 404);
        }

        // Kembalikan data jika ditemukan
        return response()->json([
            'status' => 'success',
            'message' => 'Laporan pulang berhasil diambil.',
            'data' => $laporanPulang,
        ]);
    } catch (\Exception $e) {
        \Log::error('Terjadi error di metode lihatLaporanPulang:', ['error' => $e->getMessage()]);
        return response()->json([
            'status' => 'error',
            'message' => 'Terjadi error saat memproses permintaan.',
        ], 500);
    }
}

    public function detail(Request $request)
{
    \Log::info('Masuk ke metode detail');
    \Log::info('Data yang diterima:', $request->all());

    $idJadwal = $request->query('id_jadwal');
    $tanggal = $request->query('tanggal');

    // Validasi parameter
    if (!$idJadwal || !$tanggal) {
        \Log::error('Parameter id_jadwal atau tanggal tidak valid.');
        return response()->json([
            'status' => 'error',
            'message' => 'Parameter id_jadwal atau tanggal tidak valid.'
        ], 400);
    }

    try {
        // Ambil laporan awal (jadwal) dan data donat dari laporan_datang
        \Log::info('Mengambil laporan awal dan data donat.');
        $laporanAwal = \DB::table('jadwal')
            ->leftJoin('laporan_datang', function ($join) use ($idJadwal, $tanggal) {
                $join->on('jadwal.id', '=', 'laporan_datang.id_jadwal')
                    ->where('laporan_datang.tanggal', '=', $tanggal);
            })
            ->join('karyawan', 'jadwal.id_karyawan', '=', 'karyawan.id') // Join ke tabel karyawan
            ->where('jadwal.id', $idJadwal)
            ->select(
                'jadwal.id_karyawan',
                'karyawan.nama', // Ambil nama_karyawan dari tabel karyawan
                'jadwal.shift',
                'jadwal.tempat',
                'laporan_datang.donat_bombo',
                'laporan_datang.donat_bolong',
                'laporan_datang.donat_salju',
                'laporan_datang.kelengkapan',
                'laporan_datang.catatan'
            )
            ->first();

        // Ambil stok datang
        \Log::info('Mengambil stok datang.');
        $stokDatang = StokDatang::where('id_jadwal', $idJadwal)
            ->where('tanggal', $tanggal)
            ->select(
                'id',
                \DB::raw('TIME(created_at) as jam'), // Ambil waktu dari created_at
                'donat_bombo',
                'donat_bolong',
                'donat_salju',
                'kelengkapan',
                'catatan'
            )
            ->get();

        // Ambil laporan pulang
        \Log::info('Mengambil laporan pulang.');
        $laporanPulang = Laporan::where('id_jadwal', $idJadwal)
            ->where('tanggal', $tanggal)
            ->select(
                'omset',
                'fisik',
                'pengeluaran',
                'stok_bomboloni as stok_bombo',
                'stok_bolong',
                'stok_salju',
                'kelengkapan',
                'catatan'
            )
            ->first();

        // Periksa apakah semua data ditemukan
        if (!$laporanAwal && $stokDatang->isEmpty() && !$laporanPulang) {
            \Log::info('Tidak ada data detail untuk jadwal ini pada tanggal tersebut.');
            return response()->json([
                'status' => 'error',
                'message' => 'Tidak ada data detail untuk jadwal ini pada tanggal tersebut.',
            ], 404);
        }

        // Gabungkan data dan kirimkan respons
        return response()->json([
            'status' => 'success',
            'data' => [
                'laporan_awal' => $laporanAwal,
                'stok_datang' => $stokDatang,
                'laporan_pulang' => $laporanPulang,
            ],
        ]);
    } catch (\Exception $e) {
        \Log::error('Terjadi error di metode detail:', ['error' => $e->getMessage()]);
        return response()->json([
            'status' => 'error',
            'message' => 'Terjadi error saat mengambil data detail.',
        ], 500);
    }
}

public function lihatPendapatan(Request $request)
{
    \Log::info('Masuk ke metode lihatPendapatan');
    \Log::info('Data yang diterima:', $request->all());

    try {
        // Validasi input
        $validated = $request->validate([
            'tanggal' => 'required|date',
        ]);

        \Log::info('Validasi berhasil:', $validated);

        // Cari semua `id_jadwal` yang sesuai dengan tanggal
        $jadwalIds = \DB::table('jadwal')
            ->where('date', $validated['tanggal'])
            ->pluck('id'); // Ambil semua id_jadwal

        if ($jadwalIds->isEmpty()) {
            \Log::info('Jadwal tidak ditemukan untuk tanggal tersebut.');
            return response()->json([
                'status' => 'error',
                'message' => 'Jadwal tidak ditemukan untuk tanggal tersebut.',
            ], 404);
        }

        \Log::info('Daftar id_jadwal ditemukan:', ['id_jadwal' => $jadwalIds]);

        // Ambil pendapatan dengan join ke tabel `jadwal` dan `karyawan`
        $pendapatan = Pendapatan::whereIn('pendapatan.id_jadwal', $jadwalIds)
            ->join('jadwal', 'pendapatan.id_jadwal', '=', 'jadwal.id') // Join ke tabel jadwal
            ->join('karyawan', 'jadwal.id_karyawan', '=', 'karyawan.id') // Join ke tabel karyawan
            ->leftJoin('laporan', function ($join) use ($validated) {
                $join->on('pendapatan.id_jadwal', '=', 'laporan.id_jadwal')
                     ->where('laporan.tanggal', '=', $validated['tanggal']);
            })
            ->select(
                'pendapatan.*',
                'karyawan.nama as nama_karyawan', // Ambil nama dari tabel karyawan
                'jadwal.shift',                  // Kolom dari tabel jadwal
                'jadwal.tempat',                 // Kolom dari tabel jadwal
                'laporan.catatan as laporan_catatan' // Ambil catatan dari tabel laporan
            )
            ->get();

        if ($pendapatan->isEmpty()) {
            \Log::info('Pendapatan tidak ditemukan.');
            return response()->json([
                'status' => 'error',
                'message' => 'Pendapatan tidak ditemukan untuk tanggal tersebut.',
            ], 404);
        }

        \Log::info('Pendapatan berhasil ditemukan.', ['data' => $pendapatan]);

        // Kembalikan data pendapatan dan catatan
        return response()->json([
            'status' => 'success',
            'message' => 'Pendapatan berhasil diambil.',
            'data' => $pendapatan,
        ]);
    } catch (\Illuminate\Validation\ValidationException $e) {
        // Tangani validasi error
        \Log::error('Validasi gagal:', ['errors' => $e->errors()]);
        return response()->json([
            'status' => 'error',
            'message' => 'Validasi gagal.',
            'errors' => $e->errors(),
        ], 422);
    } catch (\Exception $e) {
        // Tangani error umum lainnya
        \Log::error('Terjadi error saat mengambil pendapatan:', ['error' => $e->getMessage()]);
        return response()->json([
            'status' => 'error',
            'message' => 'Terjadi error saat memproses permintaan.',
        ], 500);
    }
}

public function laporanMingguanKaryawan(Request $request)
{
    \Log::info('Masuk ke metode laporanMingguanKaryawan');
    \Log::info('Data yang diterima:', $request->all());

    $validated = $request->validate([
        'id_karyawan' => 'required|integer',
        'start_date' => 'required|date',
        'end_date' => 'required|date|after_or_equal:start_date',
    ]);

    // Ambil id_jadwal berdasarkan id_karyawan dan tanggal
    $jadwal = Jadwal::where('id_karyawan', $validated['id_karyawan'])
        ->whereBetween('date', [$validated['start_date'], $validated['end_date']])
        ->first();

    if (!$jadwal) {
        return response()->json([
            'status' => 'error',
            'message' => 'Jadwal tidak ditemukan untuk karyawan dalam rentang tanggal tersebut.'
        ], 404);
    }

    // Ambil data dalam rentang minggu berdasarkan id_jadwal
    $laporanAwal = LaporanDatang::where('id_jadwal', $jadwal->id)
        ->whereBetween('tanggal', [$validated['start_date'], $validated['end_date']])
        ->get();

    $stokDatang = StokDatang::where('id_jadwal', $jadwal->id)
        ->whereBetween('tanggal', [$validated['start_date'], $validated['end_date']])
        ->get();

    $laporanAkhir = Laporan::where('id_jadwal', $jadwal->id)
        ->whereBetween('tanggal', [$validated['start_date'], $validated['end_date']])
        ->get();

    $pendapatan = Pendapatan::where('id_jadwal', $jadwal->id)
        ->whereBetween('tanggal', [$validated['start_date'], $validated['end_date']])
        ->get()
        ->map(function ($item) {
            $item->selisih = ($item->omset ?? 0) - ($item->omset_sistem ?? 0);
            return $item;
        });

    return response()->json([
        'status' => 'success',
        'message' => 'Laporan mingguan berhasil diambil.',
        'data' => [
            'laporan_awal' => $laporanAwal,
            'stok_datang' => $stokDatang,
            'laporan_akhir' => $laporanAkhir,
            'pendapatan' => $pendapatan,
        ],
    ]);
}

}

