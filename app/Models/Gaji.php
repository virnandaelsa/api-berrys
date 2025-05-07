<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory; // Import yang benar

class Gaji extends Model
{
    use HasFactory;

    protected $table = 'gaji';

    // Fields that are mass assignable
    protected $fillable = [
        'bagian',
        'gaji',
    ];
}
