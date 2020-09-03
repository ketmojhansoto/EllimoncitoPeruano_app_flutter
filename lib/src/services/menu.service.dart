import 'package:http/http.dart' show Client;
import 'package:ellimoncito_peruano/src/models/menu.dart';
import 'package:intl/intl.dart';
import 'conexion.dart';

class MenuService {
  Client client = Client();

  Future<List<Menu>> getMenus() async {
    final response = await client.get("$url/productos");
    if (response.statusCode == 200) {
      return menusFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Menu>> getTipos(String tipo) async {
    DateTime now = DateTime.now();
    String fechaHoy = DateFormat('yyyy-MM-dd').format(now);
    final response = await client.get("$url/productos");
    if (response.statusCode == 200) {
      List<Menu> menus = menusFromJson(response.body);
      List<Menu> menuTipo = [];
      for (var item in menus) {
        Menu menu = item;
        if (menu.tipo == tipo && menu.fecha == fechaHoy) {
          menuTipo.add(menu);
        }
      }
      return menuTipo;
    } else {
      return null;
    }
  }
}
