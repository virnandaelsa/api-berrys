<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('absensi', function (Blueprint $table) {
            $table->date('tanggal')->after('photo');
            $table->time('jam')->after('tanggal');
            $table->unsignedBigInteger('id_karyawan')->after('jam');
            $table->unsignedBigInteger('id_jadwal')->after('id_karyawan');

            // Foreign key constraints
            $table->foreign('id_karyawan')->references('id')->on('karyawan')->onDelete('cascade');
            $table->foreign('id_jadwal')->references('id')->on('jadwal')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('absensi', function (Blueprint $table) {
            $table->dropForeign(['id_karyawan']);
            $table->dropForeign(['id_jadwal']);
            $table->dropColumn(['tanggal', 'jam', 'id_karyawan', 'id_jadwal']);
        });
    }
};
