<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CutiResource extends JsonResource
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
            'tanggal' => $this->tanggal,
            'hari' => $this->hari,
            'alasan' => $this->alasan,
            'status' => $this->status,
            'id_karyawan' => $this->id_karyawan,
            'karyawan' => new KaryawanResource($this->whenLoaded('karyawan')), // Jika karyawan sudah di-include
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
