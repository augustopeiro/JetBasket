<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Cartao;

class Carrinho extends Model
{
    use HasFactory;

    protected $fillable = [
        'precoTotal',
        'dataCompra',
        'cartao_id',
    ];

    public function cartao(){
        return $this->belongsTo(Cartao::class);
    }
}
