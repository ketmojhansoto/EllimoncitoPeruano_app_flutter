import 'dart:convert';

class Menu {
  int idProducto;
  String nombre;
  String descripcion;
  String precio;
  String imagen;
  String tipo;
  String fecha;

  Menu(
      {this.idProducto,
      this.nombre,
      //this.descripcion,
      this.precio,
      this.tipo,
      this.fecha,
      this.imagen});

  factory Menu.fromJson(Map<String, dynamic> map) {
    return Menu(
      idProducto: map['id'],
      nombre: map['nombre'],
      //descripcion: map['descripcion'],
      precio: map['precio'],
      tipo: map['tipo'],
      fecha: map['fecha'],
      imagen: map['imagen'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idProducto;
    data['nombre'] = this.nombre;
    //data['descripcion'] = this.descripcion;
    data['precio'] = this.precio;
    data['tipo'] = this.tipo;
    data['fecha'] = this.fecha;
    data['imagen'] = this.imagen;
    return data;
  }

  String toString() {
    return 'Menus{id: $idProducto, nombre: $nombre, precio: $precio, fecha:$fecha, tipo:$tipo, imagen:$imagen}';
  }
}

List<Menu> menusFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Menu>.from(data.map((item) => Menu.fromJson(item)));
}

String menuToJson(Menu data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
