<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RekapGajiBulanan extends Model
{
    use HasFactory;

    protected $table = 'rekap_gaji_bulanan';

    protected $fillable = [
        'id_karyawan',
        'bulan',
        'tahun',
        'total_gaji',
        'total_jam',
        'jumlah_hari_kerja'
    ];

    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class, 'id_karyawan');
    }

    // Model RekapGajiBulanan.php
    // RekapGajiBulanan.php
    public function editGaji()
    {
        return $this->hasOne(EditGaji::class, 'id_karyawan', 'id_karyawan');
    }
}
