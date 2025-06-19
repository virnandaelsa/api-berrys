<?php

namespace App\Http\Controllers\Api;

use App\Models\Karyawan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Http\Resources\KaryawanResource;

class KaryawanController extends Controller
{
    // Display a listing of the karyawan.
    public function index()
{
    // Mengambil data karyawan dan mengurutkan berdasarkan tanggal_masuk
    $karyawans = Karyawan::orderBy('tanggal_masuk', 'asc')->get();

    // Log query untuk memeriksa apakah data karyawan diambil
    \Log::info('Fetching karyawan data:', ['total_karyawan' => $karyawans->count()]);

    if ($karyawans->isNotEmpty()) {
        \Log::info('Karyawan data found:', ['karyawan' => $karyawans]);
        return KaryawanResource::collection($karyawans);
    } else {
        \Log::warning('No karyawan data found');
        return response()->json($karyawans, 200); // Return all karyawan as JSON
    }
}

    // Store a newly created karyawan in storage.
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nik' => 'required|digits:16|unique:karyawan,nik',
            'nama' => 'required',
            'alamat' => 'required',
            'tanggal_lahir' => 'required|date',
            'jen_kel' => 'required|in:P,L',
            'no_tlp' => 'required|min:11',
            'role' => 'required',
            'tanggal_masuk' => 'required|date',
            'username' => 'required|unique:karyawan,username',
            'password' => 'required|min:8',
        ], [
            'nik.unique' => 'NIK sudah digunakan, silakan masukkan NIK lain.',
            'nik.min' => 'NIK minimal 16 karakter.',
            'no_tlp.min' => 'No Telepon minimal 11 karakter.',
            'password.min' => 'Password minimal 8 karakter.',
        ]);

        if($validator->fails()){
            return response()->json([
                'message' => 'All fields are mandetory',
                'error' => $validator->messages(),
            ], 422);
        }

        $karyawan = Karyawan::create([
            'nik' => $request->nik,
            'nama' => $request->nama,
            'alamat' => $request->alamat,
            'tanggal_lahir' => $request->tanggal_lahir,
            'jen_kel' => $request->jen_kel,
            'no_tlp' => $request->no_tlp,
            'role' => $request->role,
            'tanggal_masuk' => $request->tanggal_masuk,
            'username' => $request->username,
            'password' => bcrypt($request->password),
        ]);

        return response()->json([
            'message' => 'Karyawan berhasil ditambahkan',
            'data' => new KaryawanResource($karyawan)
        ], 200); // Return the newly created karyawan as JSON
    }

    // Show the specified karyawan.
    public function show(Karyawan $karyawan)
    {
        \Log::info('Show method called for karyawan with ID: ');
        return response()->json([
            'data' => new KaryawanResource($karyawan)
        ]);
    }

    // Update the specified karyawan in storage.
    public function update(Request $request, Karyawan $karyawan)
{
    // Validasi data, semuanya bersifat optional dengan aturan yang relevan
    $validator = Validator::make($request->all(), [
        'nama' => 'sometimes|required',
        'alamat' => 'sometimes|required',
        'tanggal_lahir' => 'sometimes|date',
        'jen_kel' => 'sometimes|in:P,L',
        'no_tlp' => 'sometimes|required',
        'role' => 'sometimes|string',
        'tanggal_masuk' => 'sometimes|date',
        'status' => 'sometimes|in:Aktif,Tidak Aktif',
        'username' => 'sometimes|string|unique:karyawan,username,' . $karyawan->id,
        'password' => 'sometimes|string|min:8',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'message' => 'Validation failed',
            'errors' => $validator->messages(),
        ], 422);
    }

    // Ambil data yang ada di request, gunakan nilai lama jika tidak ada di request
    $data = [
        'nik' => $request->get('nik', $karyawan->nik),
        'nama' => $request->get('nama', $karyawan->nama),
        'alamat' => $request->get('alamat', $karyawan->alamat),
        'tanggal_lahir' => $request->get('tanggal_lahir', $karyawan->tanggal_lahir),
        'jen_kel' => $request->get('jen_kel', $karyawan->jen_kel),
        'no_tlp' => $request->get('no_tlp', $karyawan->no_tlp),
        'role' => $request->get('role', $karyawan->role),
        'tanggal_masuk' => $request->get('tanggal_masuk', $karyawan->tanggal_masuk),
        'status' => $request->get('status', $karyawan->status),
        'username' => $request->get('username', $karyawan->username), // Tambahkan username
    ];

    // Jika password diisi, tambahkan ke data dengan hashing
    if ($request->filled('password')) {
        $data['password'] = bcrypt($request->password);
    }

    // Update data karyawan
    $karyawan->update($data);

    // Kirim response sukses
    return response()->json([
        'message' => 'Karyawan berhasil diperbarui',
        'data' => new KaryawanResource($karyawan),
    ], 200);
}

    // Remove the specified karyawan from storage.
    public function destroy(Karyawan $karyawan)
    {

        if ($karyawan) {
            $karyawan->delete();
            return response()->json(['message' => 'Karyawan deleted successfully'], 200);
        }

        return response()->json(['message' => 'Karyawan not found'], 404);
    }
}
