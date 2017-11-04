<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/enquetes', 'EnqueteController@lista');

Route::post('/enquete/{desc}/{op1}/{op2}/{op3}', 'EnqueteController@novo');

Route::get('/enquete/{id}', 'EnqueteController@consulta');

Route::get('/enquete/{id}/stats', 'EnqueteController@estatisticas');

Route::put('/enquete/{desc}/{id}', 'EnqueteController@editar');

Route::post('/enquete/vote/{op}/{id}', 'EnqueteController@votar');

Route::delete('/enquete/{id}', 'EnqueteController@excluir');