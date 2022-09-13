class Produto{
  //atributos de usuarios retornados pela API (laravel)
  int id;
  String nome;
  String codigoBarras;
  String marca;
  String descricao;
  double preco;
  int cliente_id;
  int carrinho_id;

  //construtor
  Produto({
    required this.id,
    required this.nome,
    required this.codigoBarras,
    required this.marca,
    required this.descricao,
    required this.preco,
    required this.cliente_id,
    required this.carrinho_id,
  });

  //dart para json
  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
    id: json["id"],
    nome: json["nome"],
    codigoBarras: json["codigoBarras"],
    marca: json["marca"],
    descricao: json["descricao"],
    preco: json["preco"],
    cliente_id: json["cliente_id"],
    carrinho_id: json["carrinho_id"],
  );

  //json para dart
  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "codigoBarras": codigoBarras,
    "marca": marca,
    "descricao": descricao,
    "preco": preco,
    "cliente_id": cliente_id,
    "carrinho_id": carrinho_id,
  };

  
}
