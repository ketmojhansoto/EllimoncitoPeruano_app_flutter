import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/bloc/pedido.bloc.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';
import 'package:provider/provider.dart';

class GridProduct extends StatelessWidget {
  final Producto producto;

  GridProduct({
    Key key,
    @required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<PedidoBloc>(context);
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "${producto.imagen}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: () {
                    bloc.addProductoC(producto);
                  },
                  fillColor: Colors.green,
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "${producto.nombre}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            child: Row(
              children: <Widget>[],
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
