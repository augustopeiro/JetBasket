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
        Schema::create('carrinhos', function (Blueprint $table) {
            $table->id();
            $table->decimal('precoTotal', 8, 2);
            $table->timestamp('dataCompra');
            $table->foreignId('produto_id');
            $table->timestamps();
            // $table->foreign('cartao_id')->references('id')->on('cartaos');
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
        Schema::dropIfExists('carrinhos');
    }
};
