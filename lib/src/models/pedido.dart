import 'dart:convert';

//import 'package:ellimoncito_peruano/src/models/oferta.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';

class Pedido {
  String estado;
  double subtotal;
  int mesaId;
  List<Producto> productos;
  //List<Oferta> ofertas;

  Pedido({
    this.estado,
    this.subtotal,
    this.mesaId,
    this.productos, //this.ofertas
  });
  Pedido.fromJson(Map<String, dynamic> json) {
    estado = json['estado'];
    subtotal = json['subtotal'] as double;
    mesaId = json['mesaId'] as int;
    if (json['productos'] != null) {
      productos = new List<Producto>();
      json['productos'].forEach((v) {
        productos.add(new Producto.fromJson(v));
      });
    }
    // if (json['ofertas'] != null) {
    //   ofertas = new List<Oferta>();
    //   json['ofertas'].forEach((v) {
    //     ofertas.add(new Oferta.fromJson(v));
    //   });
    // }
  }

  factory Pedido.fromJsonA(Map<String, dynamic> json) {
    var list = json['productos'] as List;
    print(list.runtimeType);
    List<Producto> productosList =
        list.map((i) => Producto.fromJson(i)).toList();
    return Pedido(
        estado: json['estado'],
        subtotal: json['subtotal'],
        mesaId: json['mesaId'],
        productos: productosList);
  }

  Map<String, dynamic> toJson() {
    return {
      "estado": estado,
      "subtotal": subtotal,
      "mesaId": mesaId,
      "productos": productos
    };
  }
}

String postToJson(Pedido data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
