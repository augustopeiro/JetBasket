import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/Carrinho.dart';
import '../api/Call_API.dart';


class ListaCarrinhos extends StatefulWidget {
  ListaCarrinhos({Key? key}) : super(key: key);

  List<Carrinho> Carrinhos = [];

  @override
  State<ListaCarrinhos> createState() => _ListaCarrinhosState();
}

class _ListaCarrinhosState extends State<ListaCarrinhos> {
  void initState() {
    super.initState();
    //carregar os usuarios
    _getCarrinhos();
  }

  
  //metodo que vai buscar a lista de usuarios
  _getCarrinhos() async {
    try {
      var response = await CallApi().getData('/carrinhos');
      if (response.statusCode == 200) {
        setState(() {
          widget.Carrinhos = (json.decode(response.body)['carrinhos'] as List)
              .map((data) => new Carrinho.fromJson(data))
              .toList();
        });
      } else {
        throw Exception('Falha ao carregar carrinhos');
      }
    } on Exception catch (e) {
      //ignore: avoid_print
      print('Erro _getCarrinhos() [ListaCarrinhos]: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: const Text('Carrinhos'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildBody() {
    return SafeArea(
        child: Column(
        children: [
        const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Lista de Carrinhos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.Carrinhos.isEmpty
            ? const Text('Nenhum carrinho')
            : GridView.builder(
                itemCount: widget.Carrinhos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => Text(
                  widget.Carrinhos[index].id.toString()),
                ),
              ),
      ),
    ]
    )
    );
  }
}
