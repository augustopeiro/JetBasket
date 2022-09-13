<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Carrinho;

class Cartao extends Model
{
    use HasFactory;

    protected $fillable = [
        'numeroCartao',
        'validade',
        'cvv',
    ];

    protected $hidden = [
        'numeroCartao',
        'validade',
        'cvv',
    ];

    public function carrinho(){
        return $this->hasMany(Carrinho::class);
    }
}
