<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Karyawan;

class Jadwal extends Model
{
    use HasFactory;

    // Tentukan tabel yang digunakan (opsional jika nama tabel mengikuti konvensi Laravel)
    protected $table = 'jadwal';

    // Tentukan kolom yang dapat diisi (mass assignable)
    protected $fillable = [
        'date',
        'hari',
        'shift',
        'tempat',
        'id_karyawan',
    ];

    // Tentukan relasi dengan model Karyawan (jika diperlukan)
    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class, 'id_karyawan');
    }

    public function absensi()
    {
        return $this->hasMany(Absensi::class, 'id_jadwal');
    }

    public function laporanDatang()
    {
        return $this->hasMany(LaporanDatang::class, 'id_jadwal');
    }
}
