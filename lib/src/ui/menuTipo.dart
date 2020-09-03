import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ellimoncito_peruano/src/models/menu.dart';
import 'package:ellimoncito_peruano/src/services/menu.service.dart';
import 'package:ellimoncito_peruano/src/ui/menu.dart';

class MenuTipo extends StatefulWidget {
  final String menuTipo;

  MenuTipo({Key key, this.menuTipo}) : super(key: key);
  @override
  _MenuTipoState createState() => _MenuTipoState();
}

class _MenuTipoState extends State<MenuTipo> {
  MenuService menuService;
  @override
  void initState() {
    super.initState();
    menuService = MenuService();
  }

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
        title: Text(widget.menuTipo + 's',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              color: Colors.green,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 35,
            ),
            onPressed: () => Navigator.pushNamed(context, 'carrito'),
            color: Colors.green,
          )
        ],
      ),
      body: FutureBuilder(
          future: menuService.getTipos(widget.menuTipo),
          builder: (BuildContext context, AsyncSnapshot<List<Menu>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Algo  salió mal: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Menu> menus = snapshot.data;
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Swiper(
                    itemCount: menus == null ? 0 : menus.length,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemBuilder: (BuildContext context, index) {
                      Menu menu = menus[index];
                      return GestureDetector(
                        child: new Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(menu.imagen),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  menu.nombre,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuVista(
                                menu: menu,
                              ),
                            ),
                          );
                        },
                      );
                      // Image.network(
                      //   "http://via.placeholder.com/288x188",
                      //   fit: BoxFit.fill,
                      // );
                    },
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
