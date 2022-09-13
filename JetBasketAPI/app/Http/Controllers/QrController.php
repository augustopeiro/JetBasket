<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\QR;

class QrController extends Controller
{
    public function allQrcodes(Request $request){
        try{
            //tenta buscar a lista de produtos
            $qrcodes = QR::orderBy('id')->get();
            return response()->json([
                'qrcodes' => $qrcodes
            ], 200);
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o errro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }
    }

    public function validaQrcode(Request $request){
        try{
            $qrcode = QR::where('qrCodigo', '=', $request->qrCodigo)->first();
           
            return response()->json([
                'qrcode' => $qrcode
            ], 200);
            
        }catch (\Throwable $th){
            //caso algum comando de try falhe, retorna o erro
            return response()->json([
                'message' => 'Erro ao buscar: '.$th->getMessage(),
            ], 500);

        }
    }
}

