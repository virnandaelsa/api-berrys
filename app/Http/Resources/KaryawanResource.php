<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class KaryawanResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'nik' => $this->nik,
            'nama' => $this->nama,
            'alamat' => $this->alamat,
            'tanggal_lahir' => $this->tanggal_lahir,
            'jen_kel' => $this->jen_kel,
            'role' => $this->role,
            'tanggal_masuk' => $this->tanggal_masuk,
            'status' => $this->status,
            'username' => $this->username,
            'password' => $this->password,
            'created_at' => $this->created_at,
        ];
    }
}
