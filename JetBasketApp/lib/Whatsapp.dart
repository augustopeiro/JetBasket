import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/ConfirmaPagamento.dart';
import 'package:flutter_application_1/Fim.dart';
import 'package:flutter_application_1/Pagamento.dart';
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
import 'package:url_launcher/url_launcher.dart';

  class Whatsapp extends StatefulWidget {
    const Whatsapp({ Key? key }) : super(key: key);
  
    @override
    State<Whatsapp> createState() => _WhatsappState();
  }
  
  class _WhatsappState extends State<Whatsapp> {
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
                padding: const EdgeInsets.only(left: 20, right: 20),

              child: Column(
              children: [     
                SizedBox(height: 20),           
                
                Text(
                  "Clique no botão abaixo para ser redirecionado ao Whatsapp da empresa",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28.0),
                ),
                
                Lottie.asset("assets/whatsapp.json", width: 600,height: 240,fit: BoxFit.contain,),
        
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 13, 119, 24), // background
                      onPrimary: Color.fromARGB(255, 5, 70, 22),
                      fixedSize: const Size(300, 50)
                       // foreground
                    ),
                    onPressed: () {abrirWhatsApp(); },
                    child: Text('Abrir WhatsApp', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                  SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      
                      height: 60,
                      width: 140,
                      
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
                            "Feito!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                             Get.offAll(ConfirmaPagamento());
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Container(
                      height: 60,
                      width: 140,
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
                            "Voltar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                             Get.to(Pagamento());                            
                          },
                        ),
                      ),                      
                    ),
                    SizedBox(width: 25),
                    
                         
                      
                                            
                                        
                  ],
                ),
              ],
            ),
      )))));
    }

    abrirWhatsApp() async {
  var whatsappUrl = "https://api.whatsapp.com/send?phone=55999999999999&text=Ol%C3%A1%2C%20gostaria%20de%20realizar%20um%20pagamento!%20%3A)";

  if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
    await launchUrl(Uri.parse(whatsappUrl));
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
  }
