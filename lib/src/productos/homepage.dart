import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/productos/productos.dart';
import 'package:ellimoncito_peruano/src/ui/categorias.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: <String, WidgetBuilder>{
          //"/inicio": (BuildContext context) => Inicio(),
          "/empresa": (BuildContext context) => Categorias(),
          "/productos": (BuildContext context) => Products(),
          "/contacto": (BuildContext context) => Contacto(),
        },
        home: Inicio());
  }
}

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("PRODUCTOS"),
      ),
      body: Center(
        child: Text("SECCIÓN PRODUCTOS"),
      ),
    );
  }
}

class Contacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("CONTACTO"),
      ),
      body: Center(
        child: Text("SECCIÓN CONTACTO"),
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 130, bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
            color: Colors.green,
            image: DecorationImage(
                image: NetworkImage(
                    "https://scontent.flim1-2.fna.fbcdn.net/v/t1.0-9/84177788_111225670438583_7886402439060914176_n.png?_nc_cat=108&_nc_sid=6e5ad9&_nc_eui2=AeHXhxPVzKpK3kj1elGzN1AiclOwKoAsG5lyU7AqgCwbmelHn4TaGcvpuYNGOtMKn4s17QTb6q7eqEjC7-zzOnaX&_nc_ohc=Gd0s-w7g34oAX8pG6-X&_nc_ht=scontent.flim1-2.fna&oh=8fe2c9408be8ffba1a09977602e50357&oe=5F430FE6"),
                alignment: Alignment.topCenter)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                    // children: <Widget>[
                    //   Padding(
                    //     padding: EdgeInsets.all(10),
                    //     child: RaisedButton(
                    //       color: Colors.lightGreen,
                    //       shape: new RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10.0)),
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, "/inicio");
                    //       },
                    //       child: SizedBox(
                    //         width: 100,
                    //         height: 100,
                    //         child: Center(
                    //           child: Text(
                    //             "INICIO",
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.w900),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    // ],
                    ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/empresa");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              "CATEGORIA",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/productos");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              "PRODUCTOS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.lightGreen,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/contacto");
                        },
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              "CONTACTO",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
