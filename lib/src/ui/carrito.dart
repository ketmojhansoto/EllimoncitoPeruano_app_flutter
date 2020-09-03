import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/bloc/pedido.bloc.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';
import 'package:ellimoncito_peruano/src/ui/pedidoVista.dart';
import 'package:ellimoncito_peruano/src/utils/const.dart';
import 'package:ellimoncito_peruano/src/widgets/carritoItem.dart';
import 'package:provider/provider.dart';

class Carrito extends StatefulWidget {
  Carrito({Key key}) : super(key: key);
  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito>
    with AutomaticKeepAliveClientMixin<Carrito> {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<PedidoBloc>(context);
    var carrito = bloc.carrito;
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView.builder(
          itemCount: carrito == null ? 0 : carrito.length,
          itemBuilder: (BuildContext context, int index) {
            Producto producto = carrito[index];
            return CarritoItem(producto: producto);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constants.rojo1,
        tooltip: "Checkout",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return PedidoVista();
              },
            ),
          );
        },
        child: Icon(
          Icons.arrow_forward,
          size: 30,
          color: Colors.white,
        ),
        heroTag: Object(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
