<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Siswa;

class SiswaController extends Controller
{
    public function index()
    {
        $siswa = Siswa::all();
        $data = ['status'=>true, 'message'=>"Tampilkan semua data", 'data'=>$siswa];
        
        return $data;
    }

    public function create(Request $request)
    {
        $siswa = new Siswa();
        $siswa->nama = $request->nama;
        $siswa->alamat = $request->alamat;
        $siswa->save();

        $data = ['status'=>true, 'message'=>"data ditambahkan", 'data'=>$siswa];
        
        return $data;
    }

    public function update(Request $request, $id)
    {
        $siswa=Siswa::find($id);
        $siswa->nama = $request->nama;
        $siswa->alamat = $request->alamat;
        $siswa->save();

        $data = ['status'=>true, 'message'=>"data diupdate", 'data'=>$siswa];
        
        return $data;
    }

    public function delete($id)
    {
        $siswa=Siswa::find($id);
        $siswa=delete();

        $data = ['status'=>true, 'message'=>"data dihapus", 'data'=>$siswa];
        
        return $data;
    }

    public function detail($id)
    {
        $siswa=Siswa::find($id);
        
        $data = ['status'=>true, 'message'=>"data detail", 'data'=>$siswa];
        
        return $data;   
    }
}
