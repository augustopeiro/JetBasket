import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Cestinha.dart';
import 'package:get/get.dart';
import 'api/Call_API.dart';
import 'NavBar.dart';
import 'model/Produto.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key}) : super(key: key);
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  ScanResult? scanResult;
  String barcode = '';
  late String nome = '';
  late Produto produto;
  List<Produto> produtos = [];
  double somaTotal = 0;

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final scanResult = this.scanResult;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              ElevatedButton.icon(
                onPressed: _scan,
                icon: Icon(Icons.camera_alt_outlined),
                label: Text('Escanear código'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(height: 15),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: produtos.length,
                itemBuilder: (BuildContext context, int index) {
                final item = produtos[index].id;
                  return Dismissible(
                    key: Key(item.toString()),
                    onDismissed: (direction) {
                      // Remove the item from the data source.
                      setState(() {
                        produtos.removeAt(index);
                        _subtrair();
                      });

                      // Then show a snackbar.
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Produto removido'),duration: Duration(seconds: 1,)));
                    },
                    child: Column(
                      children: <Widget>[
                        if (scanResult != null)
                          Card(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(produtos[index].nome +
                                      ' ' +
                                      produtos[index].marca),
                                  trailing:
                                      Text("R\$ " + produtos[index].preco.toString()),
                                  subtitle:
                                      Text(produtos[index].descricao),
                                      
                                    
                                ),
                              ],

                            ),
                          
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(produtos);
            Get.to(
              Cestinha(produtos: produtos),
            );
          },
          tooltip: 'Adicionar produto',
          child: const Icon(Icons.shopping_basket_outlined),
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() => scanResult = result);
      var data = {
        'codigoBarras': result.rawContent,
      };
      var response = await CallApi().putData(data, '/validaBarcode');
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        int id = body['produto']['id'];

        if (id > 0) {
          //cria um objeto produto com os dados vindos da API
          Produto produto = Produto(
            id: body['produto']['id'],
            nome: body['produto']['nome'],
            codigoBarras: body['produto']['codigoBarras'],
            marca: body['produto']['marca'],
            descricao: body['produto']['descricao'],
            preco: double.parse(body['produto']['preco']),
            carrinho_id: body['produto']['carrinho_id'],
            cliente_id: body['produto']['cliente_id'],
          );

          setState(() {
            this.produto = produto;
          });
          produtos.add(produto);
          Get.snackbar("Yes!!!", "Produto adicionado",
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white, duration: Duration(seconds: 1,));
          print("produto encontrado");
        } else {
          print("Produto nao encontrado");
        }
      }
    } on PlatformException catch (e) {
      setState(
        () {
          scanResult = ScanResult(
            type: ResultType.Error,
            format: BarcodeFormat.unknown,
            rawContent: e.code == BarcodeScanner.cameraAccessDenied
                ? 'The user did not grant the camera permission!'
                : 'Unknown error: $e',
          );
        },
      );
    }
    
  }

 _subtrair() {
    for (var i = 0; i < produtos.length; i++) {
      somaTotal = somaTotal - produtos[i].preco;
    };
    return somaTotal.toString();
  }
}


