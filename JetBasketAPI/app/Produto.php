<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Cliente;

class Produto extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome',
        'codigoBarras',
        'marca',
        'descricao',
        'preco'
    ];

    public function cliente(){
        return $this->belongsTo(Cliente::class);
    }

}
