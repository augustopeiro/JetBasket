import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/Fim.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'Carrinho.dart';
import 'Fim2.dart';
import 'Home_Page.dart';
import 'Login.dart';
import 'NavBar.dart';
import 'Fim.dart';

  class ConfirmaPagamento extends StatefulWidget {
    const ConfirmaPagamento({ Key? key }) : super(key: key);
  
    @override
    State<ConfirmaPagamento> createState() => _ConfirmaPagamentoState();
  }
  
  class _ConfirmaPagamentoState extends State<ConfirmaPagamento> {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
      home: Scaffold(
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
                Lottie.asset("assets/done.json", width: 600,height: 240,fit: BoxFit.contain,),
                SizedBox(height: 50),
                Text(
                  "Pagamento realizado com sucesso!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28.0),
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 150,
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
                            "Realizar nova compra",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                             Get.offAll(Fim());
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Container(
                      height: 60,
                      width: 150,
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
                             Get.offAll(Fim2());                            
                          },
                        ),
                      ),                      
                    ),                    
                  ],
                ),
              ],
            ),
      )))));
    }
  }

