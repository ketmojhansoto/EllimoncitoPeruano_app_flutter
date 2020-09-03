// import 'dart:convert';

// class Oferta {
//   int id;
//   String nombre;
//   String descripcion;
//   double precio;
//   String inicioFecha;
//   String finFecha;
//   String tipo;
//   String imagen;

//   Oferta(
//       {this.id,
//       this.nombre,
//       this.descripcion,
//       this.precio,
//       this.inicioFecha,
//       this.finFecha,
//       this.tipo,
//       this.imagen});

//   factory Oferta.fromJson(Map<String, dynamic> map) {
//     return Oferta(
//     id : map['id'],
//     nombre : map['nombre'],
//     descripcion : map['descripcion'],
//     precio : map['precio'],
//     inicioFecha : map['inicioFecha'],
//     finFecha : map['finFecha'],
//     tipo : map['tipo'],
//     imagen : map['imagen'],);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['nombre'] = this.nombre;
//     data['descripcion'] = this.descripcion;
//     data['precio'] = this.precio;
//     data['inicioFecha'] = this.inicioFecha;
//     data['finFecha'] = this.finFecha;
//     data['tipo'] = this.tipo;
//     data['imagen'] = this.imagen;
//     return data;
//   }
//   String toString() {
//     return 'Ofertas{id: $id, nombre: $nombre, descripcion: $descripcion,precio: $precio, inicioFecha:$inicioFecha, finFecha:$finFecha, tipo:$tipo, imagen:$imagen}';
//   }
// }

// List<Oferta> ofertasFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<Oferta>.from(data.map((item) => Oferta.fromJson(item)));
// }

// String ofertaToJson(Oferta data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }
