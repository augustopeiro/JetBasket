import 'package:brasil_fields/brasil_fields.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/Cliente.dart';
import 'package:get/get.dart';
import 'package:password_validator/password_validator.dart';
import 'CadastroPage2.dart';
import 'Login.dart';

class CadastroPage1 extends StatefulWidget {
  const CadastroPage1({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage1> {
  final formKey = GlobalKey<FormState>();
  late Cliente cliente;

  
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoCpf = TextEditingController();
  TextEditingController campoTelefone = TextEditingController();
  TextEditingController campoEmail = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  TextEditingController campoConfirmaSenha = TextEditingController();

  _preCadastro() {
    setState(() {
      cliente = Cliente(
          id: 0,
          nome: campoNome.text,
          cpf: campoCpf.text,
          telefone: campoTelefone.text,
          email: campoEmail.text,
          senha: campoSenha.text,
          cep: "",
          cidade: "",
          complemento: "",
          endereco: "",
          nascimento: DateTime.now());
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
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: campoNome,
              decoration: InputDecoration(
                labelText: "Nome",
                hintText: 'Escreva seu nome',
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              validator: (nome) {
                if (nome!.isEmpty) {
                  return '* Preenchimento de campo Obrigatório';
                }
              },
        
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: campoCpf,
              decoration: InputDecoration(
                labelText: "CPF",
                hintText: 'Escreva seu CPF',
                prefixIcon: Icon(Icons.numbers),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              validator: (cpf) {
                
                if (cpf!.isEmpty || !RegExp(r'^\d{3}\x2E\d{3}\x2E\d{3}\x2D\d{2}$').hasMatch(cpf)) {
                  return '* Preenchimento de campo Obrigatório';
                }else{
                  return null;
                }
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: campoTelefone,
              decoration: InputDecoration(
                labelText: "Telefone",
                hintText: 'Escreva seu telefone',
                prefixIcon: Icon(Icons.phone_android),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              validator: (telefone) {
                
                if (telefone!.isEmpty || !RegExp(r'(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$').hasMatch(telefone)) {
                  return '* Preenchimento de campo Obrigatório';
                }else{
                  return null;
                }
              },
             inputFormatters:[
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: campoEmail,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: 'Escreva seu email',
                prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              validator: (email) {
                if (email!.isEmpty || !EmailValidator.validate(email)) {
                  return '* Preenchimento de campo Obrigatório';
                }else{
                  return null;
                }
              }
            ),
            SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              controller: campoSenha,
              decoration: InputDecoration(
                labelText: "Senha",
                hintText: 'Crie uma senha',
                prefixIcon: Icon(Icons.key),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              validator: (senha) {
                PasswordValidator passwordValidator = new PasswordValidator(
                    uppercase: 1,
                    min: 8,
                    digits: 1,
                    blacklist: ["senha", "senh4", "password", "senha123"]);
                if (passwordValidator.validate(senha) == false)
                  return 'Senha deve conter 8 caracteres, 1 número e 1 letra maiúscula';
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              controller: campoConfirmaSenha,
              decoration: InputDecoration(
                labelText: "Confirmação de senha",
                hintText: 'Confirme sua senha',
                prefixIcon: Icon(Icons.key),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
              validator: (senha) {
                PasswordValidator passwordValidator = new PasswordValidator(
                    uppercase: 1,
                    min: 8,
                    digits: 1,
                    blacklist: ["senha", "senh4", "password", "senha123"]);
                if (passwordValidator.validate(senha) == false)
                  return 'Senha deve conter 8 caracteres, 1 número e 1 letra maiúscula';
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
                                Get.to(Login());
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
                                if (campoConfirmaSenha.text ==
                                    campoSenha.text) {
                                  if (formKey.currentState!.validate() == true) {
                                    _preCadastro();
                                    Get.to(CadastroPage2(
                                      cliente: cliente,
                                    ));
                                  }
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                            title: Text("Senha incorreta"),
                                            content:
                                                Text("As senhas não conferem!"),
                                          ));
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
    );
  }
}
