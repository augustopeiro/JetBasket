import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/Cliente.dart';
import 'package:get/get.dart';
import 'CadastroPage1.dart';
import 'CadastroPage3.dart';
import 'package:brasil_fields/brasil_fields.dart';

import 'Login.dart';

class CadastroPage2 extends StatefulWidget {
  CadastroPage2({Key? key, required this.cliente}) : super(key: key);

  Cliente cliente;

  @override
  _CadastroPage2State createState() => _CadastroPage2State();
}

class _CadastroPage2State extends State<CadastroPage2> {
  final formKey = GlobalKey<FormState>();
  late Cliente cli;
  @override
  initState() {
    cli = widget.cliente;
  }

  TextEditingController campoCep = TextEditingController();
  TextEditingController campoEndereco = TextEditingController();
  TextEditingController campoCidade = TextEditingController();
  TextEditingController campoComplemento = TextEditingController();

  _preCadastro() {
    setState(() {
      cli.cep = campoCep.text;
      cli.endereco = campoEndereco.text;
      cli.cidade = campoCidade.text;
      cli.complemento = campoComplemento.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text("Jet Basket", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 15),
                TextFormField(
                  controller: campoCep,
                  decoration: InputDecoration(
                    hintText: 'Escreva seu CEP',
                    prefixIcon: Icon(Icons.mail),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "CEP",
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  //|| !RegExp(r'[0-9]{8}$').hasMatch(cep)
                  validator: (cep) {
                    
                if (cep!.isEmpty ) {
                  return '* Preenchimento de campo Obrigatório';
                }
              },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter()
                  ],
                  
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: campoEndereco,
                  decoration: InputDecoration(
                    hintText: 'Escreva seu endereço',
                    prefixIcon: Icon(Icons.home),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Endereço",
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  validator: (endereco) {
                    if (endereco!.isEmpty) {
                      return '* Preenchimento de campo Obrigatório';
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: campoCidade,
                  decoration: InputDecoration(
                    hintText: 'Escreva sua cidade',
                    prefixIcon: Icon(Icons.location_city),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Cidade",
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  validator: (cidade) {
                    if (cidade!.isEmpty) {
                      return '* Preenchimento de campo Obrigatório';
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: campoComplemento,
                  decoration: InputDecoration(
                    hintText: 'Escreva seu complemento',
                    prefixIcon: Icon(Icons.list),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Complemento",
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  validator: (complemento) {
                    if (complemento!.isEmpty) {
                      return '* Preenchimento de campo Obrigatório';
                    }
                  },
                ),
                SizedBox(height: 15),
                Builder(builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 165,
                              alignment: Alignment.center,
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
                                    "Voltar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  onPressed: () {
                                    Get.to(CadastroPage1());
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 60,
                              width: 165,
                              alignment: Alignment.center,
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
                                    "Próximo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate() == true) {
                                      _preCadastro();
                                      Get.to(
                                        CadastroPage3(
                                          cliente: cli,
                                        ),
                                      );
                                    }
                                    ;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? hint;

  const CustomTextField({Key? key, required this.label, this.icon, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return '* Preenchimento de campo Obrigatório';
        }
      },
      decoration: InputDecoration(
          prefixIcon: icon == null ? null : Icon(icon),
          hintText: '$hint $label',
          labelText: '$label',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
