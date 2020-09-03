import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/models/menu.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';
import 'package:ellimoncito_peruano/src/services/producto.service.dart';
import 'package:ellimoncito_peruano/src/widgets/productosMenu.dart';

class MenuVista extends StatefulWidget {
  Menu menu;

  MenuVista({this.menu});
  @override
  _MenuVistaState createState() => _MenuVistaState();
}

class _MenuVistaState extends State<MenuVista> {
  ProductoService productoService;

  @override
  void initState() {
    super.initState();
    productoService = ProductoService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.green,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(widget.menu.descripcion,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              color: Colors.green,
            )),
        centerTitle: true,
      ),
      body: _cuerpo(context),
    );
  }

  Widget _cuerpo(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            FutureBuilder(
              future: productoService.getMenuId(widget.menu.idProducto),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Producto>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child:
                        Text("Algo  salió mal: ${snapshot.error.toString()}"),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  List<Producto> productos = snapshot.data;
                  return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.25),
                    ),
                    itemCount: productos == null ? 0 : productos.length,
                    itemBuilder: (BuildContext context, int index) {
                      Producto producto = productos[index];
                      //producto.cantidad = 1;
                      return GridProduct(
                        producto: producto,
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
