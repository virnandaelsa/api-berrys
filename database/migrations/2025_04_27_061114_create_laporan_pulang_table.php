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
        Schema::create('laporan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_jadwal'); // Relasi dengan tabel jadwal
            $table->date('tanggal'); // Tanggal laporan
            $table->decimal('omset', 15, 2)->default(0); // Omset
            $table->decimal('fisik', 15, 2)->default(0); // Fisik
            $table->decimal('pengeluaran', 15, 2)->default(0); // Pengeluaran
            $table->integer('stok_bomboloni')->default(0); // Stok Bomboloni
            $table->integer('stok_bolong')->default(0); // Stok Bolong
            $table->integer('stok_salju')->default(0); // Stok Salju
            $table->text('kelengkapan')->nullable(); // Kelengkapan
            $table->text('catatan')->nullable(); // Catatan
            $table->timestamps();

            // Foreign key ke tabel jadwal
            $table->foreign('id_jadwal')->references('id')->on('jadwal')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('laporan');
    }
};
