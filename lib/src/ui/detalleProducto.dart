import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/bloc/pedido.bloc.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';
import 'package:ellimoncito_peruano/src/ui/notifications.dart';
import 'package:provider/provider.dart';

class DetalleProducto extends StatefulWidget {
  Producto producto;

  DetalleProducto({this.producto});

  @override
  _DetalleProductoState createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  var selectedCard = 'WEIGHT';
  @override
  void initState() {
    super.initState();
    widget.producto.cantidad = 1;
  }

  void _sumarCantidad() {
    setState(() {
      widget.producto.cantidad++;
    });
  }

  void _restarCantidad() {
    setState(() {
      if (widget.producto.cantidad > 1) {
        widget.producto.cantidad--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<PedidoBloc>(context);

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Detalles',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 24, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, size: 35),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(children: [
        Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height - 82.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.20,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width)),
          Positioned(
              top: 30.0,
              left: (MediaQuery.of(context).size.width / 2) - 100.0,
              child: Hero(
                  tag: widget.producto.imagen,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(widget.producto.imagen),
                            fit: BoxFit.cover),
                      ),
                      height: 200.0,
                      width: 200.0))),
          Positioned(
              top: 250.0,
              left: 25.0,
              right: 25.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.producto.nombre,
                      style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Montserrat',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('S/. ${widget.producto.precio.toString()}0',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 32.0,
                              color: Colors.blueGrey)),
                      Container(
                        width: 125.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Colors.green),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                _restarCantidad();
                              },
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '${widget.producto.cantidad}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0),
                            ),
                            InkWell(
                              onTap: () {
                                _sumarCantidad();
                              },
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 150.0,
                    child: Text(
                      widget.producto.descripcion,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.0, left: 10),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              color: Colors.green,
                            ),
                            height: 50.0,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Center(
                              child: Text(
                                  'S/. ${(widget.producto.precio * widget.producto.cantidad).toString()}0',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                          RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              color: Colors.green,
                              child: Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                bloc.addProductoC(widget.producto);
                              })
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.only(
                          //       topRight: Radius.circular(10.0),
                          //       bottomRight: Radius.circular(10.0),
                          //     ),
                          //     color: Colors.green,
                          //   ),
                          //   height: 50.0,
                          //   width: MediaQuery.of(context).size.width * 0.4,
                          //   child: Center(
                          //     child: Icon(
                          //       Icons.add_shopping_cart,
                          //       size: 35,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ])
      ]),
    );
  }
}
