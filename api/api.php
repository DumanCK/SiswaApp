<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('siswa/tampil','SiswaController@index');
Route::post('siswa/tambah','SiswaController@create');
Route::get('/siswa/detail','SiswaController@detail');
Route::put('/siswa/ubah','SiswaController@update');
Route::delete('/siswa/hapus','SiswaController@delete');