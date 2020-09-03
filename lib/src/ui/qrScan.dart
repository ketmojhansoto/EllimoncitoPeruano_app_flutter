import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/bloc/pedido.bloc.dart';
import 'package:ellimoncito_peruano/src/models/mesa.dart';
import 'package:ellimoncito_peruano/src/models/pedido.dart';
import 'package:ellimoncito_peruano/src/services/mesa.service.dart';
import 'package:ellimoncito_peruano/src/utils/const.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrScan extends StatefulWidget {
  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  MesaService mesaService;

  String barcode;
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    super.initState();
    mesaService = MesaService();
  }

  @override
  Widget build(BuildContext context) {
    var pedidobloc = Provider.of<PedidoBloc>(context);
    Pedido pedido = pedidobloc.pedido;
    if (barcode == null) {
      return _sinEscanear(context, pedidobloc, pedido);
    } else {
      return _escaneado(context, pedidobloc, pedido);
    }
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
  }

  Widget _sinEscanear(BuildContext context, pedidobloc, Pedido pedido) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('$barcode'),
            FlatButton(
              padding: EdgeInsets.all(30),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0)),
              color: Constants.rojo1,
              child: Text(
                "Selecciona tu mesa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () async {
                await _scan();
                Mesas mesa = await mesaService.getMesaQr(barcode);
                if (mesa == null) {
                  barcode = null;
                } else {
                  pedidobloc.addMesa(mesa.idMesa);
                  pedido = pedidobloc.pedido;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _escaneado(BuildContext context, pedidobloc, Pedido pedido) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/mesa.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                    //SizedBox(width: MediaQuery.of(context).size.width * 0.1),
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
                    FlatButton(
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      color: Constants.rojo1,
                      child: Text(
                        "Volver a escoger",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () async {
                        await _scan();
                        Mesas mesa = await mesaService.getMesaQr(barcode);
                        if (mesa == null) {
                          barcode = null;
                        } else {
                          pedidobloc.addMesa(mesa.idMesa);
                          pedido = pedidobloc.pedido;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
