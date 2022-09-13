class Carrinho{
  //atributos de usuarios retornados pela API (laravel)
  int id;
  double precoTotal;
  DateTime dataCompra;
  int cartao_id;

  //construtor
  Carrinho({
    required this.id,
    required this.precoTotal,
    required this.dataCompra,
    required this.cartao_id,
  });

  //dart para json
  factory Carrinho.fromJson(Map<String, dynamic> json) => Carrinho(
    id: json["id"],
    precoTotal: json["precoTotal"],
    dataCompra: json["dataCompra"],
    cartao_id: json["cartao_id"],
  );

  //json para dart
  Map<String, dynamic> toJson() => {
    "id": id,
    "precoTotal": precoTotal,
    "dataCompra": dataCompra,
    "cartao_id": cartao_id,
  };

  
}
