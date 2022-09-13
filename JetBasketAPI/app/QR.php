<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QR extends Model
{
    use HasFactory;
    protected $table = "qrcodes";
    protected $fillable = [
        'qrCodigo',
    ];
}

