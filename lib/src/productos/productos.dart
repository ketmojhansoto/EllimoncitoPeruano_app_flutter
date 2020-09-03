import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ellimoncito_peruano/src/productos/servicesproductos.dart';

void main() => runApp(new Products());

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Productos',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'Productos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Producto>> _getProducts() async {
    var data = await http.get("https://ketpelis.com/productos");

    var jsonData = json.decode(data.body);

    List<Producto> productos = [];

    for (var u in jsonData) {
      Producto producto = Producto(u["idProducto"], u["nombre"],
          u["descripcion"], u["precio"], u["imagen"]);

      productos.add(producto);
    }

    print(productos.length);

    return productos;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int idProducto) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[idProducto].imagen),
                    ),
                    title: Text(snapshot.data[idProducto].nombre),
                    subtitle: Text(snapshot.data[idProducto].descripcion),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[idProducto])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Producto producto;

  DetailPage(this.producto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(producto.nombre),
    ));
  }
}
