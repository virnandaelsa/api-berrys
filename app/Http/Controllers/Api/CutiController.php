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
        $tanggal_mulai = $request->query('tanggal_mulai')
            ? Carbon::parse($request->query('tanggal_mulai'))->startOfWeek(Carbon::MONDAY)->toDateString()
            : now()->startOfWeek(Carbon::MONDAY)->toDateString();

        $tanggal_akhir = Carbon::parse($tanggal_mulai)->addDays(6)->toDateString();

        $cutis = Cuti::join('karyawan', 'cuti.id_karyawan', '=', 'karyawan.id')
            ->select('cuti.*', 'karyawan.nama as nama_karyawan')
            ->whereBetween('tanggal', [$tanggal_mulai, $tanggal_akhir])
            ->get();

        return response()->json(['data' => $cutis], 200);
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
