class Cartao{
  //atributos de usuarios retornados pela API (laravel)
  int id;
  String numeroCartao;
  String validade;
  String cvv;
  int clienteId;

  //construtor
  Cartao({
    required this.id,
    required this.numeroCartao,
    required this.validade,
    required this.cvv,
    required this.clienteId,
  });

  //dart para json
  factory Cartao.fromJson(Map<String, dynamic> json) => Cartao(
    id: json["id"],
    numeroCartao: json["numeroCartao"],
    validade: json["validade"],
    cvv: json["cvv"],
    clienteId: json["cliente_id"],
  );

  //json para dart
  Map<String, dynamic> toJson() => {
    "id": id,
    "numeroCartao": numeroCartao,
    "validade": validade,
    "cvv": cvv,
    "cliente_id": clienteId,
  };

  
}
