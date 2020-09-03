import 'dart:convert';

class Mesas {
  int idMesa;
  String numerodemesa;
  int capacidad;
  String descripcion;
  String codigoQR;
  //String estado;

  Mesas({
    this.idMesa,
    this.numerodemesa,
    this.capacidad,
    this.descripcion,
  });

  Mesas.fromJson(Map<String, dynamic> json) {
    idMesa = json['id'];
    numerodemesa = json['numeroMesa'];
    capacidad = json['capacidad'];
    descripcion = json['seccion'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": idMesa,
      "numeroMesa": numerodemesa,
      "capacidad": capacidad,
      "seccion": descripcion,
    };
  }
}

List<Mesas> mesasFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Mesas>.from(data.map((item) => Mesas.fromJson(item)));
}
