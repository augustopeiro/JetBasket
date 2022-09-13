import 'package:flutter/material.dart';
import 'package:flutter_application_1/ConfirmaPagamento.dart';
import 'package:flutter_application_1/ErroPagamento.dart';
import 'package:get/get.dart';

import 'NavBar.dart';
import 'Pix.dart';
import 'Whatsapp.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({Key? key}) : super(key: key);

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
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
          body: GridView.count(
              primary: false,
              padding: const EdgeInsets.only(
                  top: 150, bottom: 100, left: 20, right: 20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.purple,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(Pix());
                        },
                        child: Column(
                          children: [
                            Text("Pix",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple)),
                            Image.asset(
                              "assets/pix.png",
                              height: 100,
                              width: 400,
                            )
                          ],
                        ))),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.purple,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(ConfirmaPagamento());
                        },
                        child: Column(
                          children: [
                            Text("Cartão",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple)),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/cartoes.png",
                              height: 100,
                              width: 330,
                            )
                          ],
                        ))),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.purple,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(Whatsapp());
                        },
                        child: Column(
                          children: [
                            Text("Whatsapp",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple)),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/whatsapp.png",
                              height: 100,
                              width: 330,
                            )
                          ],
                        ))),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.purple,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Get.offAll(ErroPagamento());
                        },
                        child: Column(
                          children: [
                            Text("PayPal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple)),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/paypal.png",
                              height: 100,
                              width: 330,
                            )
                          ],
                        ))),
              ])),
    );
  }
}
