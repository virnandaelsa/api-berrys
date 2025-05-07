<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LaporanDatang extends Model
{
    use HasFactory;

    protected $table = 'laporan_datang';

    protected $fillable = [
        'id_jadwal',
        'tanggal',
        'donat_bombo',
        'donat_bolong',
        'donat_salju',
        'kelengkapan',
        'catatan',
    ];

    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class, 'id_jadwal');
    }
}
