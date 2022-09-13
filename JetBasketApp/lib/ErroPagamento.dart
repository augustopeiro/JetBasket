import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/Logout.dart';
import 'package:flutter_application_1/Pagamento.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'Carrinho.dart';
import 'Home_Page.dart';
import 'Login.dart';
import 'NavBar.dart';

class ErroPagamento extends StatefulWidget {
  const ErroPagamento({ Key? key }) : super(key: key);

  @override
  State<ErroPagamento> createState() => _ErroPagamentoState();
}

class _ErroPagamentoState extends State<ErroPagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      drawer: NavBar(), //posiciona o navbar
       appBar: AppBar(
          centerTitle: true,
          //Cria a barra superior do aap
          backgroundColor: Colors.purple,
          title: Text("Jet Basket", style: TextStyle(color: Colors.white)),
        ),
      body:   SingleChildScrollView(
      child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30),

              child: Column(
              children: [
                Lottie.asset("assets/erro2.json", width: 600,height: 240,fit: BoxFit.contain,),
                SizedBox(height: 50),
                Text(
                  "Houve um problema com o pagamento!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28.0),
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 155,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color.fromARGB(255, 203, 36, 245),
                            Color.fromARGB(255, 156, 43, 249),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          child: Text(
                            "Retornar ao pagamento",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                          Get.offAll(Pagamento());
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 60,
                      width: 155,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color.fromARGB(255, 203, 36, 245),
                            Color.fromARGB(255, 156, 43, 249),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          child: Text(
                            "Sair",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Get.offAll(Logout());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    ))));
    }
  }

