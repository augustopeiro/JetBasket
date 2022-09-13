import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/Produto.dart';
import '../api/Call_API.dart';


class ListaProdutos extends StatefulWidget {
  ListaProdutos({Key? key}) : super(key: key);

  List<Produto> Produtos = [];

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  void initState() {
    super.initState();
    //carregar os usuarios
    _getProdutos();
  }

  //metodo que vai buscar a lista de usuarios
  _getProdutos() async {
    try {
      var response = await CallApi().getData('/produtos');
      if (response.statusCode == 200) {
        setState(() {
          widget.Produtos = (json.decode(response.body)['produtos'] as List)
              .map((data) => new Produto.fromJson(data))
              .toList();
        });
      } else {
        throw Exception('Falha ao carregar produtos');
      }
    } on Exception catch (e) {
      //ignore: avoid_print
      print('Erro _getProdutos() [ListaProdutos]: $e');
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
      title: const Text('Produtos'),
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
          'Lista de Produtos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.Produtos.isEmpty
            ? const Text('Nenhum produto')
            : GridView.builder(
                itemCount: widget.Produtos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => Text(
                  widget.Produtos[index].nome,
                ),
              ),
      )
      ),
    ]
    )
    );
  }
}
