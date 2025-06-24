<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Absensi;
use App\Http\Controllers\Api\PenggajianController;
use Illuminate\Support\Facades\Validator;

class AbsensiController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function upload(Request $request)
    {
        if ($request->hasFile('photo')) {
            $file = $request->file('photo');
            $path = $file->store('uploads', 'public'); // Simpan di `storage/app/public/uploads`
            return response()->json([
                'success' => true,
                'message' => 'File uploaded successfully',
                'file_url' => asset("storage/$path")
            ]);
        }
        return response()->json(['success' => false, 'message' => 'No file uploaded'], 400);
    }

    public function index(Request $request)
{
    // Log request tanggal untuk debugging
    \Log::info('Request tanggal: ' . $request->tanggal);

    $absensi = Absensi::with(['karyawan', 'jadwal'])
        ->when($request->tanggal, function ($query) use ($request) {
            return $query->whereDate('tanggal', $request->tanggal);
        })
        ->get();

    // Log hasil query untuk debugging
    \Log::info($absensi);

    return response()->json(['data' => $absensi], 200);
}

    /**
     * Store a newly created resource in storage.
     */

     public function store(Request $request)
     {
         // Hitung jumlah absensi hari ini untuk karyawan yang bersangkutan
         $jumlahAbsensiHariIni = Absensi::where('id_karyawan', $request->id_karyawan)
             ->whereDate('tanggal', $request->tanggal)
             ->count();

         \Log::info("Jumlah absensi hari ini untuk ID {$request->id_karyawan}: {$jumlahAbsensiHariIni}");

         // Jika sudah mencapai batas 2 kali, tolak permintaan absensi
         if ($jumlahAbsensiHariIni >= 2) {
             return response()->json([
                 'success' => false,
                 'message' => 'Absensi sudah mencapai batas maksimal 2 kali per hari.',
             ], 400); // HTTP 400 Bad Request
         }

         // Simpan absensi
         $absensi = Absensi::create([
             'tanggal' => $request->tanggal,
             'jam' => $request->jam,
             'id_karyawan' => $request->id_karyawan,
             'id_jadwal' => $request->id_jadwal,
             'photo' => $request->file('photo') ? $request->file('photo')->store('uploads', 'public') : null,
             'facePhoto' => $request->file('facePhoto') ? $request->file('facePhoto')->store('uploads', 'public') : null,
         ]);

         // Hitung jumlah absensi setelah menyimpan absen baru
         $jumlahAbsensiHariIni += 1; // Tambah 1 karena absensi baru sudah disimpan

         \Log::info("Jumlah absensi hari ini untuk ID {$request->id_karyawan} setelah disimpan: {$jumlahAbsensiHariIni}");

         // Setelah absen ke-2, hitung gaji otomatis
         if ($jumlahAbsensiHariIni === 2) {
             try {
                 // Pastikan namespace PenggajianController benar
                 $penggajianController = app()->make(PenggajianController::class);
                 $penggajianController->simpanGajiHarian();
             } catch (\Exception $e) {
                 \Log::error("Gagal simpan gaji harian: " . $e->getMessage());
             }
         }

         return response()->json([
             'success' => true,
             'message' => 'Absensi berhasil disimpan.',
             'data' => $absensi,
             'file_url' => $absensi->photo ? asset("storage/{$absensi->photo}") : null,
         ]);
     }

     public function riwayatBulanan(Request $request)
     {
         $validator = Validator::make($request->all(), [
             'id_karyawan' => 'required|exists:karyawan,id',
             'bulan' => 'required|date_format:Y-m', // Format: YYYY-MM (contoh: 2025-05)
         ]);

         if ($validator->fails()) {
             return response()->json(['success' => false, 'errors' => $validator->errors()], 400);
         }

         // Ambil absensi berdasarkan bulan dan karyawan
         $absensi = Absensi::where('id_karyawan', $request->id_karyawan)
             ->whereYear('tanggal', '=', substr($request->bulan, 0, 4)) // Tahun
             ->whereMonth('tanggal', '=', substr($request->bulan, 5, 2)) // Bulan
             ->orderBy('tanggal')
             ->orderBy('jam') // Urutkan berdasarkan waktu absensi
             ->get()
             ->groupBy('tanggal'); // Kelompokkan berdasarkan tanggal

         // Format data untuk menampilkan absen datang dan pulang
         $riwayat = [];
         foreach ($absensi as $tanggal => $absenList) {
             $riwayat[] = [
                 'tanggal' => $tanggal,
                 'absensi' => $absenList->map(function ($absen, $index) {
                     return [
                         'type' => $index === 0 ? 'Datang' : 'Pulang', // Tentukan tipe absensi
                         'waktu' => $absen->jam,
                         'photo' => $absen->photo ? asset("storage/{$absen->photo}") : null,
                     ];
                 }),
             ];
         }

         return response()->json(['success' => true, 'data' => $riwayat], 200);
     }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
