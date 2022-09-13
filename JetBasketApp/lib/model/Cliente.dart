class Cliente{
  //atributos de usuarios retornados pela API (laravel)
  int id;
  String nome;
  String email;
  String senha;
  String cpf;
  DateTime nascimento;
  String telefone;
  String cep;
  String endereco;
  String complemento;
  String cidade;

  //construtor
  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.cpf,
    required this.nascimento,
    required this.telefone,
    required this.cep,
    required this.endereco,
    required this.complemento,
    required this.cidade,
  });

  //dart para json
  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
    id: json["id"],
    nome: json["nome"],
    email: json["email"],
    senha: json["senha"],
    cpf: json["cpf"],
    nascimento: json["nascimento"],
    telefone: json["telefone"],
    cep: json["cep"],
    endereco: json["endereco"],
    complemento: json["complemento"],
    cidade: json["cidade"],
  );

  //json para dart
  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "email": email,
    "senha": senha,
    "cpf": cpf,
    "nascimento": nascimento.toIso8601String(),
    "telefone": telefone,
    "cep": cep,
    "endereco": endereco,
    "complemento": complemento,
    "cidade": cidade,
  };

  
}
