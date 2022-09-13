import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/Cliente.dart';
import '../api/Call_API.dart';


class ListaClientes extends StatefulWidget {
  ListaClientes({Key? key}) : super(key: key);

  List<Cliente> Clientes = [];

  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  void initState() {
    super.initState();
    //carregar os usuarios
    _getClientes();
  }

  //metodo que vai buscar a lista de usuarios
  _getClientes() async {
    try {
      var response = await CallApi().getData('/clientes');
      if (response.statusCode == 200) {
        setState(() {
          widget.Clientes = (json.decode(response.body)['clientes'] as List)
              .map((data) => new Cliente.fromJson(data))
              .toList();
        });
      } else {
        throw Exception('Falha ao carregar clientes');
      }
    } on Exception catch (e) {
      //ignore: avoid_print
      print('Erro _getClientes() [ListaClientes]: $e');
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
      title: const Text('Clientes'),
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
          'Lista de Clientes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.Clientes.isEmpty
            ? const Text('Nenhum cliente')
            : GridView.builder(
                itemCount: widget.Clientes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) => Text(
                  widget.Clientes[index].nome,
                ),
              ),
      )
      ),
    ]
    )
    );
  }
}

