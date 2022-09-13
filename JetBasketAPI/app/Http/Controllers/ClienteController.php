<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;

class ClienteController extends Controller
{
    public function allClientes(Request $request){
        try{
            //tenta buscar a lista de clientes
            $clientes = Cliente::orderBy('nome')->get();
            return response()->json([
                'clientes' => $clientes
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }
    }

    public function cadastraCliente(Request $request){
        //vai receber os dados do flutter e cadastrar no bd
        try{
            //tenta buscar a lista de clientes
            $cliente = new Cliente();
            $cliente->nome = $request->cliente['nome'];
            $cliente->email = $request->cliente['email'];
            $cliente->senha = $request->cliente['senha'];
            $cliente->cpf = $request->cliente['cpf'];
            $cliente->nascimento = $request->cliente['nascimento'];
            $cliente->telefone = $request->cliente['telefone'];
            $cliente->cep = $request->cliente['cep'];
            $cliente->endereco = $request->cliente['endereco'];
            $cliente->complemento = $request->cliente['complemento'];
            $cliente->cidade = $request->cliente['cidade'];
            $cliente->save();
            return response()->json([
                'cliente' => $cliente
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao cadastrar cliente: '.$th->getMessage(),
            ], 500);

        }
        
    }
    public function verificaCliente(Request $request){
        try{
            
            $cliente = Cliente::where('email', '=', $request->email)->where('senha', '=', $request->senha)->first();

            if(!$cliente){
                throw ("Cliente não encontrado");
            }
            
            return response()->json([
                'cliente' => true
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }

    }
}

