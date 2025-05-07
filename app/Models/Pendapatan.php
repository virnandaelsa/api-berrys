<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pendapatan extends Model
{
    use HasFactory;

    protected $table = 'pendapatan';

    protected $fillable = [
        'id_jadwal',
        'tanggal',
        'omset',        // Inputan karyawan
        'omset_sistem', // Hasil perhitungan sistem
        'fisik',
        'pengeluaran',
    ];

    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class, 'id_jadwal');
    }
}
