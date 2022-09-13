<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clientes', function (Blueprint $table) {
            $table->id();
            $table->string('nome');
            $table->string('email', 191)->unique();
            $table->string('senha');
            $table->string('cpf', 191)->unique();
            $table->datetime('nascimento');
            $table->string('telefone');
            $table->string('cep');
            $table->string('endereco');
            $table->string('complemento');
            $table->string('cidade');
            $table->timestamps();
            $table->softdeletes();
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clientes');
    }
};
