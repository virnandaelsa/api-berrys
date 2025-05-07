<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Menjalankan query raw untuk mengubah enum status
        DB::statement("ALTER TABLE `cuti` CHANGE `status` `status` ENUM('Pending', 'Diterima', 'Ditolak') NOT NULL DEFAULT 'Pending' AFTER `alasan`");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Kembalikan enum status ke nilai sebelumnya
        DB::statement("ALTER TABLE `cuti` CHANGE `status` `status` ENUM('Setuju', 'Tidak Setuju') NOT NULL DEFAULT 'Setuju' AFTER `alasan`");
    }
};
