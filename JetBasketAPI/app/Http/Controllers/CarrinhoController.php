<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Carrinho;

class CarrinhoController extends Controller
{
    public function allCarrinhos(Request $request){
        try{
            //tenta buscar a lista de carrinhos
            $carrinhos = Carrinho::orderBy('id')->get();
            return response()->json([
                'carrinhos' => $carrinhos
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }
    }
}

