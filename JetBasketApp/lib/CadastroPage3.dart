import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/api/Call_API.dart';
import 'package:flutter_application_1/model/Cartao.dart';
import 'package:flutter_application_1/model/Cliente.dart';
import 'package:get/get.dart';
import 'Home_Page.dart';
import 'CadastroPage2.dart';
import 'package:auto_validate/auto_validate.dart';


class CadastroPage3 extends StatefulWidget {
  CadastroPage3({Key? key, required this.cliente}) : super(key: key);
  Cliente cliente;

  @override
  _CadastroPage3State createState() => _CadastroPage3State();
}

class _CadastroPage3State extends State<CadastroPage3> {
  final formKey = GlobalKey<FormState>();
  late Cliente cli;
  late Cartao cartao;
  @override
  initState() {
    cli = widget.cliente;
  }

  _fimCadastro() {
    setState(() {
      cartao = Cartao(
          id: 0,
          cvv: campoCvv.text,
          numeroCartao: campoNumCartao.text,
          validade: campoValidade.text,
          clienteId: 0);
    });
  }

  _enviaDados() async {
    try {
      var data = {
        'cliente': cli,
      };
      var response = await CallApi().putData(data, '/cadastroCliente');
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        cli.id = body['cliente']['id'];
        cartao.clienteId = cli.id;
        var dataCartao = {
          'cartao': cartao,
        };

        response = await CallApi().putData(dataCartao, '/cadastroCartao');
        if (response.statusCode == 200) {
          print(response.body);
          Get.to(Home_Page());
        } else {
          throw Exception(response.body);
        }
      } else {
        throw Exception(response.body);
      }
    } on Exception catch (e) {
      //ignore: avoid_print
      print('Erro _enviaDados() [CadastroPage3]: $e');
    }
  }

  TextEditingController campoNumCartao = TextEditingController();
  TextEditingController campoValidade = TextEditingController();
  TextEditingController campoCvv = TextEditingController();

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
                  keyboardType: TextInputType.name,
                  controller: campoNumCartao,
                  decoration: InputDecoration(
                    hintText: 'Escreva o número do cartão',
                    prefixIcon: Icon(Icons.credit_card),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Número do cartão",                   
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  validator: (cartao) {
                    //|| !RegExp(r'4[0-9]{15}$').hasMatch(cartao) || !RegExp(r'((5(([1-2]|[4-5])[0-9]{8}|0((1|6)([0-9]{7}))|3(0(4((0|[2-9])[0-9]{5})|([0-3]|[5-9])[0-9]{6})|[1-9][0-9]{7})))|((508116)\\d{4,10})|((502121)\\d{4,10})|((589916)\\d{4,10})|(2[0-9]{15})|(67[0-9]{14})|(506387)\\d{4,10})$').hasMatch(cartao)
                if (cartao!.isEmpty ) {

                  return '* Preenchimento de campo Obrigatório';
                }else{
                  return null;
                }
              },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //adicionar biblioteca brasil_fields
                    CartaoBancarioInputFormatter()
                  ],
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: campoValidade,
                  decoration: InputDecoration(
                    hintText: 'Escreva a data de validade do cartão',
                    prefixIcon: Icon(Icons.date_range_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "Validade",                 
                    
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  validator: (validade) {
                    //|| !RegExp(r'^\d{2}/\d{2}$').hasMatch(validade)
                if (validade!.isEmpty || !RegExp(r'^\d{2}/\d{2}$').hasMatch(validade)) {
                  return '* Preenchimento de campo Obrigatório';
                }else{
                  return null;
                }
              },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    //adicionar biblioteca brasil_fields
                    ValidadeCartaoInputFormatter()
                  ],
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: campoCvv,
                  decoration: InputDecoration(
                    hintText: 'Escreva o CVV do cartão',
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: "CVV",
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  
                //   validator: (cvv) {
                  
                //     if (cvv!.isEmpty) {
                //   return '* Preenchimento de campo Obrigatório';
              
                // }
                validator: 
                FormValidator.combination(
                 validators: [
                  FormValidator.required(errorMessage: '* Preenchimento de campo Obrigatório'),
                 FormValidator.maxLength(maxLength: 3, errorMessage: 'CVV deve possuir 3 caracteres numéricos!'),
                 FormValidator.minLength(minLength: 3, errorMessage: 'CVV deve possuir 3 caracteres numéricos!'),
                 FormValidator.digits(errorMessage: 'CVV deve possuir 3 caracteres numéricos!')],)
                
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
                                    Get.to(CadastroPage2(cliente: cli));
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
                                    "Cadastrar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate() == true) {
                                      _fimCadastro();
                                      _enviaDados();
                                      Get.to(Home_Page());
                                    }
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
