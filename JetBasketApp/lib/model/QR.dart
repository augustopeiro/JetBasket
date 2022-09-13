class QR{
  //atributos de usuarios retornados pela API (laravel)
  int id;
  String qrCodigo;
 
  //construtor
  QR({
    required this.id,
    required this.qrCodigo
  });

  //dart para json
  factory QR.fromJson(Map<String, dynamic> json) => QR(
    id: json["id"],
    qrCodigo: json["qrCodigo"]
  );

  //json para dart
  Map<String, dynamic> toJson() => {
    "id": id,
    "qrCodigo": qrCodigo,
  };

  
}
