import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'Home_Page.dart';
import 'NavBar.dart';

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text("Jet Basket", style: TextStyle(color: Colors.white)),
      ),
      body:  SingleChildScrollView(
      child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30),

              child: Column(
              children: [                
                Lottie.asset("assets/cestinha.json", width: 600,height: 240,fit: BoxFit.contain,),
                SizedBox(height: 5),
                Text(
                  "A Jet Basket é uma empresa fictícia de compras criada em 2022 por Augusto Peiró e Isabela Forti destinada à mercados de condomínios fechados nos quais o cliente possui total autonomia sobre suas compras. Sua missão é possibilitar compras mais rápidas, já que o cliente compra tudo que possui necessidade de maneira completamente independente de outros funcionários. Com a Jet Basket, o cliente controla todas as etapas de compra, desde o momento de entrada no mercado, escaneamento de produtos e pagamento. Esperamos levar a tecnologia para o dia-a-dia das pessoas de forma simples e eficiente. Obrigada pela visita e boas compras!",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                SizedBox(height: 15),
              ],
            ),
    ))));  
  }
}
