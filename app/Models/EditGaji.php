<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory; // Import yang benar

class EditGaji extends Model
{
    use HasFactory;

    protected $table = 'edit_gaji';

    // Fields that are mass assignable
    protected $fillable = ['id_karyawan', 'bulan', 'tahun', 'jumlah', 'keterangan', 'jenis'];

}
