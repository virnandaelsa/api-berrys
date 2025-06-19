<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Http\Resources\CutiResource;
use Carbon\Carbon;
use App\Models\Karyawan;
use App\Models\Cuti;

class CutiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
{
    // Mendapatkan tanggal mulai dari query parameter atau default ke minggu ini
    $tanggal_mulai = $request->query('tanggal_mulai')
        ? Carbon::parse($request->query('tanggal_mulai'))->startOfWeek(Carbon::MONDAY)->toDateString()
        : now()->startOfWeek(Carbon::MONDAY)->toDateString();

    // Menghitung tanggal akhir (6 hari setelah tanggal mulai)
    $tanggal_akhir = Carbon::parse($tanggal_mulai)->addDays(6)->toDateString();

    // Log tanggal mulai dan tanggal akhir
    \Log::info("API menerima filter dari tanggal mulai: $tanggal_mulai sampai tanggal akhir: $tanggal_akhir");

    // Menjalankan query untuk mengambil data cuti yang ada dalam rentang tanggal yang sudah ditentukan
    $cutis = Cuti::join('karyawan', 'cuti.id_karyawan', '=', 'karyawan.id')
    ->select('cuti.*', 'karyawan.nama as nama_karyawan')
    ->whereBetween('tanggal', [$tanggal_mulai, $tanggal_akhir])
    ->orderBy('tanggal', 'asc') // urut berdasarkan tanggal naik (paling awal dulu)
    ->get();

    // Log hasil query cuti (untuk debugging atau monitoring)
    \Log::info("Data cuti yang ditemukan: ", ['cutis' => $cutis]);

    // Mengembalikan response JSON dengan data cuti
    return response()->json(['data' => $cutis], 200);
}

// Controller method untuk mengambil data cuti dalam 1 bulan
    public function getCutiByMonth(Request $request) {
    $bulan = $request->query('bulan');
    $tahun = $request->query('tahun');

    \Log::info("Bulan: $bulan, Tahun: $tahun");

    // Ambil data cuti dalam rentang tanggal tersebut dan urutkan berdasarkan tanggal
    $cutis = Cuti::whereMonth('tanggal', $bulan)
            ->whereYear('tanggal', $tahun)
            ->orderBy('tanggal', 'asc') // tambahkan baris ini untuk urut tanggal naik
            ->get();

    \Log::info("Data cuti yang ditemukan: " . $cutis);

    return response()->json([
        'data' => $cutis
    ]);
}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'tanggal' => 'required|date',
            'hari' => 'required',
            'alasan' => 'required',
            'id_karyawan' => 'required',
        ]);
        if($validator->fails()){
            return response()->json([
                'message' => 'All fields are mandetory',
                'error' => $validator->messages(),
            ], 422);
        }

        $cuti = Cuti::create([
            'tanggal' => $request->tanggal,
            'hari' => $request->hari,
            'alasan' => $request->alasan,
            'id_karyawan' => $request->id_karyawan,
        ]);

        return response()->json([
            'message' => 'Cuti berhasil ditambahkan',
            'data' => new CutiResource($cuti)
        ], 200); // Return the newly created karyawan as JSON
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
    public function update(Request $request, $id)
{
    $validator = Validator::make($request->all(),[
        'status' => 'required|in:Diterima,Ditolak',
    ]);

    if($validator->fails()){
        return response()->json([
            'message' => 'All fields are mandatory',
            'error' => $validator->messages(),
        ], 422);
    }

    $cuti = Cuti::find($id); // Mencari data berdasarkan ID

    if (!$cuti) {
        return response()->json(['message' => 'Cuti not found'], 404);
    }

    // Update data cuti
    $cuti->update([
        'status' => $request->status,
    ]);

    return response()->json([
        'message' => 'Cuti berhasil diupdate',
        'data' => new CutiResource($cuti)
    ], 200);
}

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cuti $cuti)
    {
        if ($cuti) {
            $cuti->delete();
            return response()->json(['message' => 'Cuti deleted successfully'], 200);
        }

        return response()->json(['message' => 'Cuti not found'], 404);
    }
}
