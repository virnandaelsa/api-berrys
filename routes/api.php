<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\KaryawanController;
use App\Http\Controllers\Api\JadwalController;
use App\Http\Controllers\Api\CutiController;
use App\Http\Controllers\Api\PenjualanController;
use App\Http\Controllers\Api\AbsensiController;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\PenggajianController;
use App\Http\Controllers\Api\LaporanDatangController;
use App\Http\Controllers\Api\LoginController;

// Login
Route::post('/login', [LoginController::class, 'login'])->name('login');
Route::post('/login/karyawan', [LoginController::class, 'loginKaryawan']);

Route::middleware("auth:karyawan")->group(function(){
    Route::post('/logout/karyawan', [LoginController::class, 'logout']);

    Route::get('/dashboard/karyawan', [DashboardController::class, 'DashKaryawan']);

    Route::post('cuti', [CutiController::class, 'store'])->name('cuti.store');
    Route::get('cuti/karyawan', [CutiController::class, 'getCutiByMonth']);

    Route::post('/absensi', [AbsensiController::class, 'store']);
    Route::get('absensi/riwayatBulanan', [AbsensiController::class, 'riwayatBulanan']);

    Route::get('jadwal/karyawan', [jadwalController::class, 'index']);

    Route::get('/penggajian/karyawan/{id}', [PenggajianController::class, 'showByKaryawan']);
    Route::post('/penggajian/edit-gaji', [PenggajianController::class, 'tambahEditGaji']);

    Route::get('/lihat/karyawan/{karyawan}', [KaryawanController::class, 'show']);
    Route::put('/edit/karyawan/{karyawan}', [KaryawanController::class, 'update']);

    Route::post('/laporan', [LaporanDatangController::class, 'laporan']);
    Route::post('/laporan/datang', [LaporanDatangController::class, 'laporan_datang']);
    Route::post('/stok/datang', [LaporanDatangController::class, 'stok_datang']);
    Route::post('/pendapatan/hitung', [LaporanDatangController::class, 'hitungPendapatan']);
    Route::get('laporan/mingguan/karyawan', [LaporanDatangController::class, 'laporanMingguanKaryawan']);
    Route::get('detail-laporan', [LaporanDatangController::class, 'detail']);
});

// Menampilkan daftar semua karyawan
Route::middleware("auth:owner")->group(function(){
    Route::post('/logout', [LoginController::class, 'logout']);

    Route::get('/karyawan', [KaryawanController::class, 'index'])->name('karyawan.index');
    Route::get('/karyawan/create', [KaryawanController::class, 'create'])->name('karyawan.create');
    Route::post('/karyawan', [KaryawanController::class, 'store'])->name('karyawan.store');
    Route::get('/karyawan/{karyawan}/edit', [KaryawanController::class, 'edit'])->name('karyawan.edit');
    Route::put('/karyawan/{karyawan}', [KaryawanController::class, 'update'])->name('karyawan.update');
    Route::patch('/karyawan/{karyawan}', [KaryawanController::class, 'update']);
    Route::delete('/karyawan/{karyawan}', [KaryawanController::class, 'destroy'])->name('karyawan.destroy');
    Route::get('/karyawan/{karyawan}', [KaryawanController::class, 'show']);

    Route::apiResource('jadwal', JadwalController::class);
    Route::put('/jadwal', [JadwalController::class, 'update']);
    Route::get('/jadwal/{id_karyawan}', [JadwalController::class, 'getJadwalByRange']);
    Route::get('jadwal/date', [JadwalController::class, 'getAllJadwalByDate']);

    Route::get('cuti', [CutiController::class, 'index'])->name('cuti.index');
    Route::get('cuti/{id}', [CutiController::class, 'show'])->name('cuti.show');
    Route::delete('cuti/{id}', [CutiController::class, 'destroy'])->name('cuti.destroy');
    Route::put('cuti/{id}', [CutiController::class, 'update']);

    Route::get('/absensi', [AbsensiController::class, 'index']);

    Route::get('/dashboard/admin', [DashboardController::class, 'DashAdmin']);
    Route::get('/pendapatan/tahunan', [DashboardController::class, 'pendapatanTahunan']);

    Route::get('/penggajian', [PenggajianController::class, 'index']);
    Route::get('/penggajian/{id}', [PenggajianController::class, 'showByKaryawan']);
    Route::post('/penggajian/simpan-harian/{id}', [PenggajianController::class, 'simpanGajiHarian']);
    Route::get('karyawan/{id_karyawan}/month-year', [PenggajianController::class, 'getByMonthYear']);

    Route::get('/laporan/datang', [LaporanDatangController::class, 'lihatLaporanDatang']);
    Route::get('/stok/datang', [LaporanDatangController::class, 'lihatStokDatang']);
    Route::get('/laporan/pulang', [LaporanDatangController::class, 'lihatLaporanPulang']);
    Route::get('/stok/detail', [LaporanDatangController::class, 'detail']);
    Route::get('/pendapatan', [LaporanDatangController::class, 'lihatPendapatan']);
});

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
