<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Produto;

class Cliente extends Model
{
    
    use HasFactory;

    protected $fillable = [
        'nome',
        'email', 
        'senha',
        'cpf',
        'nascimento',
        'telefone',
        'cep',
        'endereco',
        'complemento',
        'cidade', 
        
    ];

    protected $hidden = [
        'senha',
    ];

    protected $appends = [
        'idade',
    ];

    public function getIdadeAttribute(){
        //return $this->nascimento->diffInYears();
    }

    public function produto(){
        return $this->hasMany(Produto::class);
    }

}

