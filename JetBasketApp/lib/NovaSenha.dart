import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'Carrinho.dart';
import 'Home_Page.dart';
import 'Login.dart';


class NovaSenha extends StatelessWidget {
  const NovaSenha({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      home: Senha(),         
    );
  }
}

class Senha extends StatefulWidget {
  const Senha({Key? key}) : super(key: key);

  @override
  State<Senha> createState() => _SenhaState();
}

class _SenhaState extends State<Senha> {
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(Login());
      super.initState();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.purple),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                //height: 200,
                //width: 500,
                child: Image.asset("assets/logo.png")),
            Text("Jet Basket",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 5,),
            Text("--- Sua nova senha está a caminho! ---", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}