import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'NavBar.dart';
import 'Pagamento.dart';
import 'model/Produto.dart';
import 'Carrinho.dart';

class Cestinha extends StatefulWidget {
  Cestinha({required this.produtos}) : super();
  List<Produto> produtos;

  @override
  _CestinhaState createState() => _CestinhaState();
}

class _CestinhaState extends State<Cestinha> {
  late List<Produto> listaDeProdutos;
  //late double somaTotal = 0;
  double somaTotal = 0;

  @override
  initState() {
    listaDeProdutos = widget.produtos;
  }

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listaDeProdutos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        //SizedBox(height: 25),
                        Card(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(listaDeProdutos[index].nome, style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                                   trailing: Text(("R\$ " + (listaDeProdutos[index].preco).toString()), style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                                  
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              Container(
                child: Text("TOTAL:        R\$ " + _somar(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: (){
                  Get.to(Pagamento());
                },
                icon: Icon(Icons.rocket),
                label: Text('Finalizar compra'),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 80),
                    primary: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        )),
                        
              ),
            ],
          ),
        ),
      ),
    );
  }

  _somar() {
    for (var i = 0; i < listaDeProdutos.length; i++) {
      somaTotal = somaTotal + listaDeProdutos[i].preco;
    }
    ;
    return somaTotal.toString();
  }

  _subtrair() {
    for (var i = 0; i < listaDeProdutos.length; i++) {
      somaTotal = somaTotal - listaDeProdutos[i].preco;
    }
    ;
    return somaTotal.toString();
  }
}
