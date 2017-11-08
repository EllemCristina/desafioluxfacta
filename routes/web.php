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


Route::get('/enquetes', 'EnqueteController@lista'); //traz todas enquetes

Route::post('/enquete/{desc}/{op1}/{op2}/{op3}', 'EnqueteController@novo'); //adiciona uma nova enquete

Route::get('/enquete/{id}', 'EnqueteController@consulta'); //consulta uma enquete por id

Route::get('/enquete/{id}/stats', 'EnqueteController@estatisticas'); //traz a quantidade de votos da enquete

Route::put('/enquete/{desc}/{id}', 'EnqueteController@editar');  //edita a descrição da enquete

Route::post('/enquete/vote/{op}/{id}', 'EnqueteController@votar'); //vota em uma opção específica e id

Route::delete('/enquete/{id}', 'EnqueteController@excluir'); //exclui uma enquete