import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/Cartao.dart';
import '../api/Call_API.dart';


class ListaCartaos extends StatefulWidget {
  ListaCartaos({Key? key}) : super(key: key);

  List<Cartao> Cartaos = [];

  @override
  State<ListaCartaos> createState() => _ListaCartaosState();
}

class _ListaCartaosState extends State<ListaCartaos> {
  void initState() {
    super.initState();
    //carregar os usuarios
    _getCartaos();
  }

  //metodo que vai buscar a lista de usuarios
  _getCartaos() async {
    try {
      var response = await CallApi().getData('/cartaos');
      if (response.statusCode == 200) {
        setState(() {
          widget.Cartaos = (json.decode(response.body)['cartaos'] as List)
              .map((data) => new Cartao.fromJson(data))
              .toList();
        });
      } else {
        throw Exception('Falha ao carregar cartaos');
      }
    } on Exception catch (e) {
      //ignore: avoid_print
      print('Erro _getCartaos() [ListaCartaos]: $e');
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
      title: const Text('Cartaos'),
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
          'Lista de Cartaos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.Cartaos.isEmpty
            ? const Text('Nenhum cartao')
            : GridView.builder(
                itemCount: widget.Cartaos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => Text(
                  widget.Cartaos[index].numeroCartao,
                ),
              ),
      )
      ),
    ]
    )
    );
  }
}
