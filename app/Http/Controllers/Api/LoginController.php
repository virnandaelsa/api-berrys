<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\Owner;
use App\Models\Karyawan;
use Illuminate\Support\Facades\Log; // Pastikan Log facade diimport

class LoginController extends Controller
{
    public function login(Request $request)
    {
        // Validasi input
        $request->validate([
            'username' => ['required', 'string'],
            'password' => ['required'],
        ]);

        Log::info('Login attempt for Owner', ['username' => $request->username]); // Log untuk mencoba login

        $owner = Owner::where('username', $request->username)->first();

        if (!$owner || !Hash::check($request->password, $owner->password)) {
            Log::warning('Login failed for Owner', ['username' => $request->username]); // Log untuk gagal login
            return response()->json(['message' => 'Username atau password salah'], 401);
        }

        Log::info('Login successful for Owner', ['username' => $request->username, 'owner_id' => $owner->id]); // Log untuk login berhasil

        // Membuat token
        $token = $owner->createToken('owner-token')->plainTextToken;

        // Log token creation
        Log::info('Token created for Owner', ['owner_id' => $owner->id, 'token' => $token]); // Log untuk token yang dibuat

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $owner
        ]);
    }

    public function logout(Request $request)
    {
        Log::info('Logout attempt for User', ['user_id' => $request->user()->id]); // Log saat logout

        $request->user()->currentAccessToken()->delete();

        Log::info('Logout successful for User', ['user_id' => $request->user()->id]); // Log saat logout berhasil

        return response()->json(['message' => 'Logout berhasil']);
    }

    public function loginKaryawan(Request $request)
    {
        // Validasi input
        $request->validate([
            'username' => ['required', 'string'], // Change 'username' to 'string' or any other appropriate rule
            'password' => ['required'],
        ]);

        Log::info('Login attempt for Karyawan', ['username' => $request->username]); // Log untuk mencoba login

        $karyawan = Karyawan::where('username', $request->username)->first();

        if (!$karyawan || !Hash::check($request->password, $karyawan->password)) {
            Log::warning('Login failed for Karyawan', ['username' => $request->username]); // Log untuk gagal login
            return response()->json(['message' => 'Username atau password salah'], 401);
        }

        Log::info('Login successful for Karyawan', ['username' => $request->username, 'karyawan_id' => $karyawan->id]); // Log untuk login berhasil

        $token = $karyawan->createToken('karyawan-token')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $karyawan
        ]);
    }
}
