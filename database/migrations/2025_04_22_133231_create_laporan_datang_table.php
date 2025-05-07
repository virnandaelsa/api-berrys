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
        Schema::create('laporan_datang', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_jadwal'); // relasi ke tabel jadwal (foreign key kalau ada)
            $table->date('tanggal'); // format tanggal
            $table->integer('donat_bombo');
            $table->integer('donat_bolong');
            $table->integer('donat_salju');
            $table->text('kelengkapan');
            $table->text('catatan');
            $table->foreign('id_jadwal')->references('id')->on('jadwal')->onDelete('cascade');
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('laporan-datang');
    }
};
