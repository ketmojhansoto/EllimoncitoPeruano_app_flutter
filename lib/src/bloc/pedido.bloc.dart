import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/models/pedido.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';

class PedidoBloc with ChangeNotifier {
  Pedido pedido = Pedido();
  List<Producto> _carrito = [];
  List<Producto> get carrito => _carrito;
  double totalCarritoValue = 0;

  //int get total => carrito.length;

  void addProductoC(producto) {
    int index = _carrito.indexWhere((i) => i.idProducto == producto.id);
    print(index);
    if (index != -1)
      updateProductoC(producto, producto.cantidad + 1);
    else {
      carrito.add(producto);
      //calculateTotal();
    }
  }

  void removeProductoC(producto) {
    int index = _carrito.indexWhere((i) => i.idProducto == producto.id);
    _carrito[index].cantidad = 1;
    _carrito.removeWhere((item) => item.idProducto == producto.id);
    //calculateTotal();
  }

  void updateProductoC(producto, qty) {
    int index = _carrito.indexWhere((i) => i.idProducto == producto.id);
    _carrito[index].cantidad = qty;
    if (_carrito[index].cantidad == 0) removeProductoC(producto);

    //calculateTotal();
  }

  void clearCarrito() {
    _carrito.forEach((f) => f.cantidad = 1);
    _carrito = [];
  }

  void addProductoP(producto) {
    int index = _carrito.indexWhere((i) => i.idProducto == producto.id);
    print(index);
    if (index != -1)
      updateProductoP(producto, producto.cantidad + 1);
    else {
      carrito.add(producto);
      // calculateTotal();
    }
  }

  void removeProductoP(producto) {
    int index = _carrito.indexWhere((i) => i.idProducto == producto.id);
    _carrito[index].cantidad = 1;
    _carrito.removeWhere((item) => item.idProducto == producto.id);
    //calculateTotal();
  }

  void updateProductoP(producto, qty) {
    int index = _carrito.indexWhere((i) => i.idProducto == producto.id);
    _carrito[index].cantidad = qty;
    if (_carrito[index].cantidad == 0) removeProductoP(producto);

    //calculateTotal();
  }

  void clearPedidoItem() {
    _carrito.forEach((f) => f.cantidad = 1);
    _carrito = [];
  }

  // void calculateTotal() {
  //   totalCarritoValue = 0;
  //   _carrito.forEach((f) {
  //     totalCarritoValue += f.precio * f.cantidad;
  //   });
  // }

  void addMesa(int mesaId) {
    pedido.mesaId = mesaId;
  }

  void addProductos(List<Producto> productos) {
    pedido.subtotal = totalCarritoValue;
    pedido.estado = "pendiente";
    pedido.productos = productos;
    print(pedido.productos);
  }
}
