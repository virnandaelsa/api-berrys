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

// Logout (berlaku untuk keduanya)
Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function () {
    Route::resource('karyawan', KaryawanController::class);
});

Route::get('/karyawan/{karyawan}', [KaryawanController::class, 'show']);
Route::apiResource('jadwal', JadwalController::class);
Route::put('/jadwal', [JadwalController::class, 'update']);
Route::get('/jadwal/{id_karyawan}', [JadwalController::class, 'getJadwalByRange']);
Route::get('jadwal/date', [JadwalController::class, 'getAllJadwalByDate']);

Route::apiResource('cuti', CutiController::class);
Route::put('cuti/{id}', [CutiController::class, 'update']);

Route::post('/absensi', [AbsensiController::class, 'store']);
Route::get('/absensi', [AbsensiController::class, 'index']);
Route::get('absensi/riwayatBulanan', [AbsensiController::class, 'riwayatBulanan']);

Route::get('/dashboard/admin', [DashboardController::class, 'DashAdmin']);
Route::get('/pendapatan/tahunan', [DashboardController::class, 'pendapatanTahunan']);

Route::get('/penggajian', [PenggajianController::class, 'index']);
Route::get('/penggajian/karyawan/{id}', [PenggajianController::class, 'showByKaryawan']);
Route::post('/penggajian/simpan-harian/{id}', [PenggajianController::class, 'simpanGajiHarian']);
Route::get('karyawan/{id_karyawan}/month-year', [PenggajianController::class, 'getByMonthYear']);
Route::post('/penggajian/edit-gaji', [PenggajianController::class, 'tambahEditGaji']);

Route::post('/laporan', [LaporanDatangController::class, 'laporan']);
Route::post('/laporan/datang', [LaporanDatangController::class, 'laporan_datang']);
Route::post('/stok/datang', [LaporanDatangController::class, 'stok_datang']);
Route::post('/pendapatan/hitung', [LaporanDatangController::class, 'hitungPendapatan']);
Route::get('/laporan/datang', [LaporanDatangController::class, 'lihatLaporanDatang']);
Route::get('/stok/datang', [LaporanDatangController::class, 'lihatStokDatang']);
Route::get('/laporan/pulang', [LaporanDatangController::class, 'lihatLaporanPulang']);
Route::get('/stok/detail', [LaporanDatangController::class, 'detail']);
Route::get('/pendapatan', [LaporanDatangController::class, 'lihatPendapatan']);
Route::get('laporan/mingguan/karyawan', [LaporanDatangController::class, 'laporanMingguanKaryawan']);

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
