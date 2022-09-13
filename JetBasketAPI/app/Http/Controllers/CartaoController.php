<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cartao;

class CartaoController extends Controller
{
    public function allCartaos(Request $request){
        try{
            //tenta buscar a lista de produtos
            $cartaos = Cartao::orderBy('id')->get();
            return response()->json([
                'cartaos' => $cartaos
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }
    }

    public function cadastraCartao(Request $request){
        //vai receber os dados do flutter e cadastrar no bd
        try{
            //tenta buscar a lista de clientes
            $cartao = new Cartao();
            $cartao->numeroCartao = $request->cartao['numeroCartao'];
            $cartao->validade = $request->cartao['validade'];
            $cartao->cvv = $request->cartao['cvv'];
            $cartao->cliente_id = $request->cartao['cliente_id'];
            $cartao->save();
            return response()->json([
                'cartao' => $cartao
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao cadastrar cartão: '.$th->getMessage(),
            ], 500);

        }
        
    }
}

