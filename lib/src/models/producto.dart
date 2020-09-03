import 'dart:convert';

class Producto {
  int idProducto;
  String nombre;
  String descripcion;
  double precio;
  String imagen;
  int categoriaId;
  int cantidad;

  Producto(
      {this.idProducto = 0,
      this.nombre,
      this.descripcion,
      this.precio = 0,
      this.imagen,
      this.categoriaId = 0,
      this.cantidad = 1});

  factory Producto.fromJson(Map<String, dynamic> map) {
    return Producto(
      idProducto: map["idProducto"],
      nombre: map["nombre"],
      descripcion: map["descripcion"],
      precio: map["precio"].toDouble(),
      imagen: map["imagen"],
      //categoriaId: map["categoriaId"],
      //cantidad: map["cantidad"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idProducto": idProducto,
      "nombre": nombre,
      "descripcion": descripcion,
      "precio": precio,
      "imagen": imagen,
      //"categoriaId": categoriaId,
      //"cantidad": cantidad
    };
  }

  @override
  String toString() {
    return 'Productos {idProducto: $idProducto, nombre: $nombre, descripcion: $descripcion, precio: $precio, imagen: $imagen }';
  }
}

List<Producto> productosFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Producto>.from(data.map((item) => Producto.fromJson(item)));
}

List<Producto> productosFromJson1(String jsonData) {
  final data = json.decode(jsonData)["Productos"];
  return List<Producto>.from(data.map((item) => Producto.fromJson(item)));
}

List<Producto> desayunoFromJson(String jsonData) {
  final data = json.decode(jsonData)["productos"];
  return List<Producto>.from(data.map((item) => Producto.fromJson(item)));
}

List<Producto> menuIdFromJson(String jsonData) {
  final data = json.decode(jsonData)["productos"];
  return List<Producto>.from(data.map((item) => Producto.fromJson(item)));
}

String productoToJson(Producto data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
