<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    // database/migrations/xxxx_xx_xx_xxxxxx_add_jenis_to_edit_gaji_table.php
    public function up()
    {
        Schema::table('edit_gaji', function (Blueprint $table) {
            $table->string('jenis')->after('jumlah'); // Menambahkan kolom jenis setelah kolom jumlah
        });
    }

    public function down()
    {
        Schema::table('edit_gaji', function (Blueprint $table) {
            $table->dropColumn('jenis');
        });
    }
};
