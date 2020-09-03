import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/bloc/pedido.bloc.dart';
import 'package:ellimoncito_peruano/src/models/pedido.dart';
import 'package:ellimoncito_peruano/src/services/pedido.service.dart';
import 'package:ellimoncito_peruano/src/ui/menuTipo.dart';

void main() => runApp(Categorias());

class Categorias extends StatefulWidget {
  final Future<Pedido> pedido;
  Categorias({Key key, this.pedido}) : super(key: key);

  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  PedidoService pedidoService;
  @override
  void initState() {
    super.initState();
    pedidoService = PedidoService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _desayuno(context),
            _almuerzo(context),
            _cena(context),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _desayuno(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              margin: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/maniana.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'Ceviche',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: FractionalOffset.centerLeft,
              child: Image(
                image: AssetImage('assets/images/ceviche.png'),
                height: 120.0,
                width: 120.0,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuTipo(menuTipo: 'Ceviche'),
            ),
          );
        },
      ),
    );
  }

  Widget _almuerzo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              margin: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tarde.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'Arroz',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: FractionalOffset.centerLeft,
              child: Image(
                image: AssetImage('assets/images/arroz.png'),
                height: 120.0,
                width: 120.0,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuTipo(menuTipo: 'Arroce'),
            ),
          );
        },
      ),
    );
  }

  Widget _cena(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              margin: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/noche.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'Criollos',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: FractionalOffset.centerLeft,
              child: Image(
                image: AssetImage('assets/images/criollos.png'),
                height: 120.0,
                width: 120.0,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuTipo(menuTipo: 'Criollo'),
            ),
          );
        },
      ),
    );
  }
}
