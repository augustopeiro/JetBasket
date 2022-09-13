import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ConfirmaPagamento.dart';
import 'package:flutter_application_1/Pagamento.dart';
import 'package:get/get.dart';
import 'CadastroPage1.dart';
import 'RecuperarSenhaPage.dart';
import 'Home_Page.dart';
import 'api/Call_API.dart';

class Paypal extends StatefulWidget {
  const Paypal({Key? key}) : super(key: key);

  @override
  _PaypalState createState() => _PaypalState();
}

class _PaypalState extends State<Paypal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          //Cria a barra superior do aap
          backgroundColor: Colors.white,
          title: Image.asset("paypal1.png", height: 150, width: 350, fit: BoxFit.contain),
        ),
      backgroundColor: Color.fromARGB(255, 243, 243, 244),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Faça login com sua conta PayPal",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      validator: (email) {
                        if(email!.isEmpty){
                          if(!EmailValidator.validate(email)){
                            return "* E-mail não é válido!";
                          }
                          }
                      }
                    
                ),
                SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 13, 22, 119), // background
                      
                      fixedSize: const Size(225, 60)
                       // foreground
                    ),
                    onPressed: () {Get.offAll(ConfirmaPagamento()); },
                    child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 13, 22, 119), // background
                      
                      fixedSize: const Size(225, 60)
                       // foreground
                    ),
                    onPressed: () {Pagamento(); },
                    child: Text('Voltar', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                  ],
                ),
                /*ButtonTheme(
                  child: Row(
                    children: [
                      ButtonBar(
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Entrar'),
                            onPressed: () {
                              if (_validarLogin()) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Home_Page()),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(width: 15),
                          ElevatedButton(
                            child: Text('Cadastrar'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroPage1()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),*/
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}