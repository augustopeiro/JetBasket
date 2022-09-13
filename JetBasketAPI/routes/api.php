<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ProdutoController;
use App\Http\Controllers\CarrinhoController;
use App\Http\Controllers\CartaoController;
use App\Http\Controllers\QrController;

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

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::get('/clientes', [ClienteController::class,'allClientes']);
Route::put('/cadastroCliente', [ClienteController::class,'cadastraCliente']);
Route::get('/cadastroCliente', [ClienteController::class,'cadastraCliente']);
Route::get('/produtos', [ProdutoController::class,'allProdutos']);
Route::get('/validaBarcode', [ProdutoController::class,'validaBarcode']);
Route::put('/validaBarcode', [ProdutoController::class,'validaBarcode']);
Route::get('/cartaos', [CartaoController::class,'allCartaos']);
Route::put('/cadastroCartao', [CartaoController::class,'cadastraCartao']);
Route::get('/carrinhos', [CarrinhoController::class,'allCarrinhos']);
Route::get('/qrcodes', [QrController::class,'validaQrcode']);
Route::put('/qrcodes', [QrController::class,'validaQrcode']);

Route::put('/verificaCliente', [ClienteController::class,'verificaCliente']);
// Route::put('/clientes', [ProdutoController::class,'verificaCliente']);
