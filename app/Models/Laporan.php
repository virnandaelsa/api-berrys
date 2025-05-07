<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Laporan extends Model
{
    use HasFactory;

    protected $table = 'laporan';

    protected $fillable = [
        'id_jadwal',
        'tanggal',
        'omset',
        'fisik',
        'pengeluaran',
        'stok_bomboloni',
        'stok_bolong',
        'stok_salju',
        'kelengkapan',
        'catatan',
    ];
    
    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class, 'id_jadwal');
    }
}
