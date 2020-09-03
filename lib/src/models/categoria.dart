import 'dart:convert';

class Categoria {
  int idCategoria;
  String nombre;
  String descripcion;

  Categoria({this.idCategoria = 0, this.nombre, this.descripcion});

  factory Categoria.fromJson(Map<String, dynamic> map) {
    return Categoria(
        idCategoria: map["id"],
        nombre: map["nombre"],
        descripcion: map["descripcion"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": idCategoria, "nombre": nombre, "descripcion": descripcion};
  }

  @override
  String toString() {
    return 'Categoria{id: $idCategoria, nombre: $nombre, descripcion: $descripcion}';
  }
}

List<Categoria> categoriasFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Categoria>.from(data.map((item) => Categoria.fromJson(item)));
}

String categoriaToJson(Categoria data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
