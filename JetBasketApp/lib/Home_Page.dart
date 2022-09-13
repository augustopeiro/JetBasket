import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'Carrinho.dart';
import 'NavBar.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'api/Call_API.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'model/QR.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String? scanResult;
  late String qrcode = '';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_basket_rounded,
                    color: Colors.purple,
                    size: 200.0,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: _scan,
                    icon: Icon(Icons.qr_code_2_outlined),
                    label: Text('Abrir Leitor de QRcode'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
      ),
        );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       backgroundColor: Colors.orange,
  //       drawer: NavBar(), //posiciona o navbar
  //       appBar: AppBar(
  //           //Cria a barra superior do aap
  //           backgroundColor: Colors.purple,
  //           title: Text("Jet Basket", style: TextStyle(color: Colors.white)),
  //           actions: <Widget>[
  //             Padding(
  //                 padding: const EdgeInsets.only(
  //                     right: 16.0, top: 17.0), // posição do icone
  //                 child: GestureDetector(
  //                     child: Stack(
  //                         alignment: Alignment.topCenter,
  //                         children: <Widget>[
  //                       Icon(
  //                         Icons.shopping_cart, //adiciona icone de carrinho
  //                         size: 26.0, // tamanho do icone
  //                       )
  //                     ])))
  //           ]),
  //       body: SingleChildScrollView(
  //         child: SizedBox(
  //           //width: MediaQuery.of(context).size.width,
  //           //height: MediaQuery.of(context).size.height,
  //           child: Padding(
  //             padding: const EdgeInsets.all(10),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   Icons.shopping_basket_rounded,
  //                   color: Colors.purple,
  //                   size: 200.0,
  //                 ),
  //                 SizedBox(height: 5),
  //                 // Text(
  //                 //   "Jet Basket",
  //                 //   style: TextStyle(
  //                 //       color: Colors.white,
  //                 //       fontSize: 24.0,
  //                 //       fontWeight: FontWeight.bold),
  //                 // ),
  //                 SizedBox(height: 15),
  //                 ElevatedButton.icon(
  //                   onPressed: _scan,
  //                   icon: Icon(Icons.qr_code_2_outlined),
  //                   label: Text('Abrir Leitor de QRcode'),
  //                   style: ElevatedButton.styleFrom(
  //                       primary: Colors.purple,
  //                       padding: const EdgeInsets.symmetric(
  //                           horizontal: 50, vertical: 20),
  //                       textStyle: const TextStyle(
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.white)),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
      setState(() => scanResult = result.rawContent.toString());

      var data = {
        'qrCodigo': result.rawContent,
      };
      var response = await CallApi().putData(data, '/qrcodes');
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        int id = int.parse(body['qrcode']['id'].toString());

        if (id > 0) {
          //cria um objeto produto com os dados vindos da API
          QR qrcode = QR(
              id: int.parse(body['qrcode']['id'].toString()),
              qrCodigo: body['qrcode']['qrCodigo'].toString());

          setState(() {
            this.qrcode = qrcode.toString();
          });

          Get.to(Carrinho());
          print("qrcode lido");
        }
      }
    } on PlatformException catch (e) {
      setState(() {
        // scanResult = ScanResult(
        //   type: ResultType.Error,
        //   format: BarcodeFormat.unknown,
        //   rawContent: e.code == BarcodeScanner.cameraAccessDenied
        //       ? 'The user did not grant the camera permission!'
        //       : 'Unknown error: $e',
        // );
      });
    }
  }
}
