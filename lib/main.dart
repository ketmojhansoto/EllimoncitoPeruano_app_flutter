import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/bloc/pedido.bloc.dart';
import 'package:provider/provider.dart';

import 'package:ellimoncito_peruano/src/ui/app.dart';
import 'package:ellimoncito_peruano/src/ui/carrito.dart';
import 'package:ellimoncito_peruano/src/ui/menu.dart';
import 'package:ellimoncito_peruano/src/ui/menuTipo.dart';
import 'package:ellimoncito_peruano/src/ui/splashscreen.dart';

import 'package:ellimoncito_peruano/src/utils/theme.dart';
import 'package:ellimoncito_peruano/src/utils/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PedidoBloc>(
      create: (context) => PedidoBloc(),
      child: MyApp1(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      title: Constants.appName,
      theme: basicTheme(),
      routes: {
        'Splash': (BuildContext context) => Splash(),
        'App': (BuildContext context) => App(),
        'carrito': (context) => Carrito(),
        'menuTipo': (context) => MenuTipo(),
        'menu': (context) => MenuVista(),
      },
    );
  }
}
