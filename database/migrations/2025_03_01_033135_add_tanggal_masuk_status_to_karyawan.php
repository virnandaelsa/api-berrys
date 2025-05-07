<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::table('karyawan', function (Blueprint $table) {
            $table->date('tanggal_masuk')->nullable()->after('role');
            $table->enum('status', ['Aktif', 'Tidak Aktif'])->default('Aktif')->after('tanggal_masuk');
        });
    }

    public function down()
    {
        Schema::table('karyawan', function (Blueprint $table) {
            $table->dropColumn(['tanggal_masuk', 'status']);
        });
    }
};
