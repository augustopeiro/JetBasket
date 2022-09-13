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
        Schema::create('produtos', function (Blueprint $table) {
            $table->id();
            $table->string('nome');
            $table->string('codigoBarras');
            $table->string('marca');
            $table->string('descricao');
            $table->decimal('preco', 8, 2);
            $table->foreignId('cliente_id');
            $table->foreignId('carrinho_id');
            $table->timestamps();
            // $table->foreign('cliente_id')->references('id')->on('clientes');
            // $table->foreign('carrinho_id')->references('id')->on('carrinhos');
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
        Schema::dropIfExists('produtos');
    }
};
