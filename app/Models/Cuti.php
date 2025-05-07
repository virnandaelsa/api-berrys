<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Karyawan;

class Cuti extends Model
{
    use HasFactory;

    // Tentukan tabel yang digunakan (opsional jika nama tabel mengikuti konvensi Laravel)
    protected $table = 'cuti';

    // Tentukan kolom yang dapat diisi (mass assignable)
    protected $fillable = [
        'tanggal',
        'hari',
        'alasan',
        'status',
        'id_karyawan',
    ];

    // Tentukan relasi dengan model Karyawan (jika diperlukan)
    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class, 'id_karyawan');
    }
}
