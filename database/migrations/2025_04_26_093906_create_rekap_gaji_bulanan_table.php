<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRekapGajiBulananTable extends Migration
{
    public function up()
    {
        Schema::create('rekap_gaji_bulanan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_karyawan'); // Relasi ke karyawan
            $table->integer('bulan'); // Bulan (1-12)
            $table->integer('tahun'); // Tahun
            $table->decimal('total_gaji', 15, 2); // Total gaji bulanan
            $table->decimal('total_jam', 10, 2); // Total jam kerja bulanan
            $table->integer('jumlah_hari_kerja'); // Jumlah hari kerja
            $table->timestamps();

            $table->foreign('id_karyawan')->references('id')->on('karyawan')->onDelete('cascade');
            $table->unique(['id_karyawan', 'bulan', 'tahun']); // Kombinasi unik
        });
    }

    public function down()
    {
        Schema::dropIfExists('rekap_gaji_bulanan');
    }
}
