import 'package:flutter/material.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:ellimoncito_peruano/src/bloc/pedido.bloc.dart';
import 'package:ellimoncito_peruano/src/models/pedido.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';
import 'package:ellimoncito_peruano/src/services/pedido.service.dart';
import 'package:ellimoncito_peruano/src/utils/const.dart';
import 'package:ellimoncito_peruano/src/widgets/pedidoItem.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class PedidoVista extends StatefulWidget {
  @override
  _PedidoVistaState createState() => _PedidoVistaState();
}

class _PedidoVistaState extends State<PedidoVista> {
  bool _isLoading = false;
  PedidoService pedidoService;
  final TextEditingController _couponlControl = new TextEditingController();
  @override
  void initState() {
    super.initState();
    pedidoService = PedidoService();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<PedidoBloc>(context);
    var carrito = bloc.carrito;
    Pedido pedido = bloc.pedido;
    String mesa;
    if (pedido.mesaId != null) {
      mesa = pedido.mesaId.toString();
    } else {
      mesa = "No seleccionado";
    }

    //bloc.calculateTotal();
    return _mesaValida(context, bloc, pedido, carrito);
  }

  Widget _mesaValida(
      BuildContext context, bloc, Pedido pedido, List<Producto> carrito) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Pedido",
          style: TextStyle(
            color: Constants.rojo1,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Constants.rojo1,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 60),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Número de mesa',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_center_focus,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/mesa.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
                          Text(
                            'Mesa',
                            style: TextStyle(
                              color: Constants.cyan,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '${pedido.mesaId}',
                            style: TextStyle(
                              color: Constants.cyan,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Detalle del Pedido",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: carrito == null ? 0 : carrito.length,
              itemBuilder: (BuildContext context, int index) {
                Producto producto = carrito[index];
                return PedidoItem(
                  producto: producto,
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Card(
        elevation: 4.0,
        child: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Total: S/. ${bloc.totalCarritoValue}0",
                          style: TextStyle(
                            fontSize: 18,
                            color: Constants.rojo1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                    width: 150.0,
                    height: 50.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      color: Constants.rojo1,
                      child: Text(
                        "Realizar Pedido",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (pedido.mesaId != null) {
                          bloc.addProductos(carrito);
                          setState(() => _isLoading = true);
                          Pedido newPedido = bloc.pedido;
                          pedidoService
                              .createPedido(newPedido)
                              .then((isSuccess) {
                            setState(() => _isLoading = false);
                          });
                          await animated_dialog_box.showCustomAlertBox(
                            context: context,
                            firstButton: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: Colors.green,
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            yourWidget: Container(
                              child: Text(
                                  'Tu pedido ya ha sido enviado, en breve disfrutarás de nuestra cocina'),
                            ),
                          );
                        } else {
                          await animated_dialog_box.showCustomAlertBox(
                            context: context,
                            firstButton: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: Colors.green,
                              child: Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            yourWidget: Container(
                              child: Text('Selecciona una mesa para continuar'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: 60,
        ),
      ),
    );
  }
}
