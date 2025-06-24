<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Http\Resources\JadwalResource;
use App\Models\Karyawan;
use App\Models\Jadwal;
use Carbon\Carbon;

class JadwalController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $tanggal_mulai = $request->query('tanggal_mulai')
            ? Carbon::parse($request->query('tanggal_mulai'))->startOfWeek(Carbon::MONDAY)->toDateString()
            : now()->startOfWeek(Carbon::MONDAY)->toDateString();

        $tanggal_akhir = Carbon::parse($tanggal_mulai)->addDays(6)->toDateString();

        // Debugging: Log query parameter
        \Log::info("API menerima filter dari $tanggal_mulai sampai $tanggal_akhir");

        $jadwals = Jadwal::join('karyawan', 'jadwal.id_karyawan', '=', 'karyawan.id')
            ->whereBetween('date', [$tanggal_mulai, $tanggal_akhir])
            ->select('jadwal.*', 'karyawan.nama as nama_karyawan')
            ->orderByRaw("FIELD(hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu')")
            ->get();

        return response()->json(['data' => $jadwals], 200);
    }

    public function cariByTempatTanggal(Request $request)
{
    $tempat = $request->query('tempat');
    $tanggal = $request->query('date');

    // Validasi sederhana
    if (!$tempat || !$tanggal) {
        return response()->json([
            'message' => 'tempat dan date wajib diisi'
        ], 400);
    }

    $jadwals = Jadwal::join('karyawan', 'jadwal.id_karyawan', '=', 'karyawan.id')
        ->where('jadwal.tempat', $tempat)
        ->where('jadwal.date', $tanggal)
        ->select('jadwal.*', 'karyawan.nama as nama_karyawan')
        ->get();

    return response()->json(['data' => $jadwals], 200);
}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
{
    \Log::info("Memulai proses penyimpanan jadwal.");

    // Validasi input
    \Log::info("Memvalidasi input...");
    $validator = Validator::make($request->all(), [
        'jadwal' => 'required|array',
        'jadwal.*.tempat' => 'required|string',
        'jadwal.*.shift' => 'required|string',
        'jadwal.*.hari' => 'required|string',
        'jadwal.*.date' => 'required|date',
        'jadwal.*.id_karyawan' => 'required', // Tidak langsung divalidasi sebagai array
    ]);

    if ($validator->fails()) {
        \Log::error("Validasi gagal dengan error: " . json_encode($validator->errors()));
        return response()->json([
            'message' => 'Validasi gagal',
            'errors' => $validator->errors(),
        ], 422);
    }

    // Simpan setiap data ke database
    \Log::info("Memproses data jadwal untuk disimpan...");
    foreach ($request->jadwal as $data) {
        \Log::info("Memproses data jadwal: " . json_encode($data));

        // Periksa apakah id_karyawan adalah array atau string
        $idKaryawanList = is_array($data['id_karyawan']) ? $data['id_karyawan'] : [$data['id_karyawan']];

        foreach ($idKaryawanList as $idKaryawan) {
            if (is_null($idKaryawan)) {
                \Log::info("ID karyawan kosong, lewati data ini.");
                continue;
            }

            Jadwal::create([
                'tempat' => $data['tempat'],
                'shift' => $data['shift'],
                'hari' => $data['hari'],
                'date' => $data['date'],
                'id_karyawan' => $idKaryawan,
            ]);

            \Log::info("Jadwal berhasil disimpan untuk karyawan ID: {$idKaryawan}");
        }
    }

    \Log::info("Proses penyimpanan jadwal selesai.");
    return response()->json([
        'message' => 'Jadwal berhasil disimpan!',
    ], 201);
}

    /**
     * Display the specified resource.
     */
    public function show(Request $request, $id)
{
    $jadwal = Jadwal::find($id);
    if (!$jadwal) {
        return response()->json(['message' => 'Jadwal tidak ditemukan'], 404);
    }

    // Ambil rentang satu minggu berdasarkan tanggal dari jadwal yang ditemukan
    $tanggal_mulai = Carbon::parse($jadwal->date)->startOfWeek(Carbon::MONDAY)->toDateString();
    $tanggal_akhir = Carbon::parse($tanggal_mulai)->addDays(6)->toDateString();

    // Ambil semua jadwal dalam minggu yang sama
    $jadwalList = Jadwal::whereBetween('date', [$tanggal_mulai, $tanggal_akhir])->get();

    return response()->json(['data' => $jadwalList], 200);
}

    /**
     * Update the specified resource in storage.
     */
   public function update(Request $request)
{
    \Log::info("Mulai proses update jadwal.");

    // Validasi input
    \Log::info("Validasi input request jadwal.");
    $validator = Validator::make($request->all(), [
        'jadwal' => 'required|array',
        'jadwal.*.action' => 'required|string|in:insert,delete,update',
        'jadwal.*.tempat' => 'required|string',
        'jadwal.*.shift' => 'required|string',
        'jadwal.*.hari' => 'required|string|in:Senin,Selasa,Rabu,Kamis,Jumat,Sabtu,Minggu',
        'jadwal.*.date' => 'required|date',
        // insert & delete pakai id_karyawan, update pakai id_karyawan_lama & id_karyawan_baru
        'jadwal.*.id_karyawan' => 'required_if:jadwal.*.action,insert,delete|integer',
        'jadwal.*.id_karyawan_lama' => 'required_if:jadwal.*.action,update|integer',
        'jadwal.*.id_karyawan_baru' => 'required_if:jadwal.*.action,update|integer|different:jadwal.*.id_karyawan_lama',
    ]);
    if ($validator->fails()) {
        \Log::warning("Validasi gagal pada input jadwal.", ['errors' => $validator->messages()]);
        return response()->json([
            'message' => 'Validasi gagal',
            'errors' => $validator->messages(),
        ], 422);
    }

    $jadwals = $request->jadwal;
    \Log::info("Proses update dimulai untuk " . count($jadwals) . " data jadwal.");

    $inserted = 0;
    $deleted = 0;
    $updated = 0;

    foreach ($jadwals as $index => $data) {
        if ($data['action'] === 'insert') {
            $exists = \App\Models\Jadwal::where([
                'date' => $data['date'],
                'tempat' => $data['tempat'],
                'shift' => $data['shift'],
                'hari' => $data['hari'],
                'id_karyawan' => $data['id_karyawan'],
            ])->first();
            if (!$exists) {
                \App\Models\Jadwal::create([
                    'date' => $data['date'],
                    'tempat' => $data['tempat'],
                    'shift' => $data['shift'],
                    'hari' => $data['hari'],
                    'id_karyawan' => $data['id_karyawan'],
                    // tambahkan kolom lain jika ada
                ]);
                $inserted++;
                \Log::info("Insert jadwal: " . json_encode($data));
            }
        } elseif ($data['action'] === 'delete') {
            \App\Models\Jadwal::where([
                'date' => $data['date'],
                'tempat' => $data['tempat'],
                'shift' => $data['shift'],
                'hari' => $data['hari'],
                'id_karyawan' => $data['id_karyawan'],
            ])->delete();
            $deleted++;
            \Log::info("Delete jadwal: " . json_encode($data));
        } elseif ($data['action'] === 'update') {
            $jadwal = \App\Models\Jadwal::where([
                'date' => $data['date'],
                'tempat' => $data['tempat'],
                'shift' => $data['shift'],
                'hari' => $data['hari'],
                'id_karyawan' => $data['id_karyawan_lama'],
            ])->first();
            if ($jadwal) {
                $jadwal->update([
                    'id_karyawan' => $data['id_karyawan_baru']
                ]);
                $updated++;
                \Log::info("Update jadwal: " . json_encode($data));
            }
        }
    }

    \Log::info("Proses update jadwal selesai. Inserted: $inserted, Deleted: $deleted, Updated: $updated");
    return response()->json([
        'message' => "Jadwal berhasil diupdate.",
        'inserted' => $inserted,
        'deleted' => $deleted,
        'updated' => $updated
    ], 200);
}
    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $jadwal = Jadwal::find($id);
        if (!$jadwal) {
            return response()->json(['message' => 'Jadwal tidak ditemukan'], 404);
        }

        $jadwal->delete();

        return response()->json(['message' => 'Jadwal berhasil dihapus'], 200);
    }

    public function getJadwalByRange($id_karyawan, Request $request)
    {
        $startDate = $request->query('start_date'); // format: dd/mm/yyyy
        $endDate = $request->query('end_date');

        // Convert to Y-m-d for database query
        $start = \Carbon\Carbon::createFromFormat('d/m/Y', $startDate)->startOfDay();
        $end = \Carbon\Carbon::createFromFormat('d/m/Y', $endDate)->endOfDay();

        $jadwal = Jadwal::where('id_karyawan', $id_karyawan)
            ->whereBetween('tanggal', [$start, $end])
            ->get();

        return response()->json($jadwal);
    }

    // Method untuk melihat semua jadwal karyawan berdasarkan tanggal (semua karyawan)
    public function getAllJadwalByDate(Request $request)
    {
        // Validasi parameter tanggal
        $validator = Validator::make($request->all(), [
            'date' => 'required|date',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $validator->errors(),
            ], 422);
        }

        // Ambil tanggal dari request
        $date = Carbon::parse($request->date);

        // Cari jadwal untuk semua karyawan berdasarkan tanggal
        $jadwals = Jadwal::whereDate('date', $date->toDateString())
            ->join('karyawan', 'jadwal.id_karyawan', '=', 'karyawan.id')
            ->select('jadwal.*', 'karyawan.nama as nama_karyawan')
            ->get();

        if ($jadwals->isEmpty()) {
            return response()->json(['message' => 'Tidak ada jadwal pada tanggal tersebut'], 404);
        }

        return response()->json(['data' => $jadwals], 200);
    }

}

