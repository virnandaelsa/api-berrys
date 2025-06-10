<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable; // Ini yang benar
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Karyawan extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'karyawan';

    protected $fillable = [
        'nik',
        'nama',
        'alamat',
        'tanggal_lahir',
        'jen_kel',
        'no_tlp',
        'role',
        'tanggal_masuk',
        'status',
        'username',
        'password',
    ];

    protected $dates = ['tanggal_lahir', 'tanggal_masuk'];

    protected $hidden = ['password'];

    public function jadwals()
    {
        return $this->hasMany(Jadwal::class, 'id_karyawan');
    }

    public function cuti()
    {
        return $this->hasMany(Cuti::class, 'id_karyawan');
    }

    public function absensi()
    {
        return $this->hasMany(Absensi::class, 'id_karyawan');
    }
}
