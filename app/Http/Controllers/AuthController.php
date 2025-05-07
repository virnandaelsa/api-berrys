<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function createTokenForUser(Request $request)
    {
        // Validasi user dan input request (misalnya email dan password)
        $user = User::find(1); // Gantilah dengan mekanisme pencarian user berdasarkan input (email/password)

        // Cek jika user ditemukan
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        // Membuat token
        $token = $user->createToken('YourAppName')->plainTextToken;

        // Kembalikan token sebagai response
        return response()->json(['token' => $token]);
    }
}

