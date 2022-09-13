<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Produto;

class ProdutoController extends Controller
{
    public function allProdutos(Request $request){
        try{
            //tenta buscar a lista de produtos
            $produtos = Produto::orderBy('id')->get();
            return response()->json([
                'produtos' => $produtos
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }
    }

    public function validaBarcode(Request $request){
        try{
            //tenta buscar a lista de produtos
            $produto = Produto::where('codigoBarras', '=', $request->codigoBarras)->first();
           
            return response()->json([
                'produto' => $produto
            ], 200);
            
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }
    }
}
