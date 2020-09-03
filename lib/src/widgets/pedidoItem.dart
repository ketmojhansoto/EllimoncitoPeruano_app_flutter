import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';
import 'package:ellimoncito_peruano/src/ui/detalleProducto.dart';
import 'package:ellimoncito_peruano/src/utils/const.dart';

class PedidoItem extends StatefulWidget {
  final Producto producto;

  PedidoItem({Key key, @required this.producto}) : super(key: key);
  @override
  _PedidoItemState createState() => _PedidoItemState();
}

class _PedidoItemState extends State<PedidoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width / 3.5,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "${widget.producto.imagen}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "${widget.producto.nombre}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text(
                      'S/. ${widget.producto.precio * widget.producto.cantidad}0',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Cantidad:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        Container(
                          width: 30,
                          child: Center(
                            child: Text(
                              "${widget.producto.cantidad}",
                              style: TextStyle(
                                  color: Constants.rojo1,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
