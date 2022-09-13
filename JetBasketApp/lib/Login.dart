import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CadastroPage1.dart';
import 'RecuperarSenhaPage.dart';
import 'Home_Page.dart';
import 'api/Call_API.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_basket_rounded,
                  color: Colors.purple,
                  size: 200.0,
                ),
                SizedBox(height: 5),
                Text(
                  "Jet Basket",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                SizedBox(height: 15),
                TextField(
                  onChanged: (text) {
                    senha = text;
                  },
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
                    Container(
                      height: 60,
                      width: 175,
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
                            "Entrar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onPressed: () {
                            // if (Form.of(context)?.validate() == true) {
                              _validarLogin();
                            // }
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 60,
                      width: 175,
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
                            "Cadastrar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          onPressed: () {
                            Get.to(CadastroPage1());
                          },
                        ),
                      ),
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
                TextButton(
                    child: Text(
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecuperarSenhaPage(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validarLogin() async {
    try {
      var data = {
        'email': email,
        'senha': senha,
      };
      var response = await CallApi().putData(data, '/verificaCliente');
      if (response.statusCode == 200) {
        print(response.body);
        Get.to(Home_Page());
      } else {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Falha no login"),
                  content: Text("Email ou senha inválida!"),
                ));
      }
    } on Exception catch (e) {
      //ignore: avoid_print
      print('Erro _validarLogin() [Login]: $e');
    }
  }
}
