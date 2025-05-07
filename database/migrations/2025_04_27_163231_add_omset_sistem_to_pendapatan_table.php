<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('pendapatan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_jadwal');
            $table->date('tanggal');
            $table->decimal('omset', 15, 2); // Omset hasil perhitungan
            $table->decimal('omset_sistem', 15, 2);
            $table->decimal('fisik', 15, 2)->nullable(); // Fisik dari inputan
            $table->decimal('pengeluaran', 15, 2)->nullable(); // Pengeluaran dari inputan
            $table->timestamps();

            // Relasi ke tabel jadwal
            $table->foreign('id_jadwal')->references('id')->on('jadwal')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('pendapatan');
    }
};
