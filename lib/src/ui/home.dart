import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/models/menu.dart';
import 'package:ellimoncito_peruano/src/models/oferta.dart';
import 'package:ellimoncito_peruano/src/services/menu.service.dart';
import 'package:ellimoncito_peruano/src/services/oferta.service.dart';

import 'package:ellimoncito_peruano/src/services/producto.service.dart';
import 'package:ellimoncito_peruano/src/models/producto.dart';

import 'package:ellimoncito_peruano/src/ui/detalleProducto.dart';

//QR

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductoService productoService;
  //OfertaService ofertaService;
  MenuService menuService;

  @override
  void initState() {
    super.initState();
    productoService = ProductoService();
    //ofertaService = OfertaService();
    menuService = MenuService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.white,
          margin: EdgeInsets.all(3),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                _seccion1(context),
                _seccion2(context),
                _seccion3(context),
              ],
            ),
          )),
    );
  }

  Widget _seccion1(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.white,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'menú',
                  style:
                      TextStyle(color: Colors.green, height: 1, fontSize: 26),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 65, top: 20, bottom: 20),
                child: _lista1(context))
          ],
        ));
  }

  Widget _lista1(BuildContext context) {
    return FutureBuilder(
      future: menuService.getMenus(),
      builder: (BuildContext context, AsyncSnapshot<List<Menu>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Algo  salió mal: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Menu> menus = snapshot.data;
          return new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menus == null ? 0 : menus.length,
            itemBuilder: (BuildContext context, index) {
              Menu menu = menus[index];
              return CupertinoButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(menu.imagen),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          menu.descripcion,
                          style: TextStyle(
                            color: Colors.green,
                            backgroundColor: Colors.white60,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.green,
                          ),
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'S/. ${menu.precio}0',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DetalleProducto(
                  //       producto: men,
                  //     ),
                  //   ),
                  // );
                },
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _seccion2(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.35,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'destacados',
                  style:
                      TextStyle(color: Colors.green, height: 1, fontSize: 26),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 65, top: 20, bottom: 20),
                child: _lista2(context))
          ],
        ));
  }

  Widget _lista2(BuildContext context) {
    return FutureBuilder(
      future: productoService.getDestacados(),
      builder: (BuildContext context, AsyncSnapshot<List<Producto>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Algo  salió mal: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Producto> productos = snapshot.data;

          return new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productos == null ? 0 : productos.length,
            itemBuilder: (BuildContext context, index) {
              Producto producto = productos[index];
              return CupertinoButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(producto.imagen),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          producto.nombre,
                          style: TextStyle(
                            color: Colors.green,
                            backgroundColor: Colors.white60,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.green,
                          ),
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'S/. ${producto.precio}0',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DetalleProducto(producto: producto);
                      },
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _seccion3(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.white,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Ofertas',
                  style:
                      TextStyle(color: Colors.green, height: 1, fontSize: 26),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65, top: 20, bottom: 20),
              //child: _lista3(context)
            )
          ],
        ));
  }

  // Widget _lista3(BuildContext context) {
  //   return FutureBuilder(
  //     future: ofertaService.getOfertas(),
  //     builder: (BuildContext context, AsyncSnapshot<List<Oferta>> snapshot) {
  //       if (snapshot.hasError) {
  //         return Center(
  //           child: Text("Algo  salió mal: ${snapshot.error.toString()}"),
  //         );
  //       } else if (snapshot.connectionState == ConnectionState.done) {
  //         List<Oferta> ofertas = snapshot.data;
  //         return new ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: ofertas == null ? 0 : ofertas.length,
  //           itemBuilder: (BuildContext context, index) {
  //             Oferta oferta = ofertas[index];
  //             return CupertinoButton(
  //               child: Container(
  //                 width: MediaQuery.of(context).size.width * 0.50,
  //                 height: MediaQuery.of(context).size.width * 0.90,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                     image: NetworkImage(oferta.imagen),
  //                     fit: BoxFit.cover,
  //                   ),
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //                 child: Container(
  //                   margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
  //                   child: Column(
  //                     children: <Widget>[
  //                       Text(
  //                         oferta.nombre,
  //                         style: TextStyle(
  //                           color: Colors.green,
  //                           backgroundColor: Colors.white60,
  //                           fontSize: 26,
  //                           fontWeight: FontWeight.w600,
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(top: 70),
  //                       ),
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius:
  //                               BorderRadius.all(Radius.circular(10.0)),
  //                           color: Colors.green, //Color(0xFFB94845),
  //                         ),
  //                         margin: EdgeInsets.only(left: 10),
  //                         padding: EdgeInsets.all(10),
  //                         child: Text(
  //                           'S/. ${oferta.precio}0',
  //                           style: TextStyle(color: Colors.white, fontSize: 25),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               onPressed: () {
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //     builder: (context) => DetalleProducto(
  //                 //       producto: producto,
  //                 //     ),
  //                 //   ),
  //                 // );
  //               },
  //             );
  //           },
  //         );
  //       }
//         else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
}
