import 'package:http/http.dart' show Client;
import 'package:ellimoncito_peruano/src/models/producto.dart';
import 'conexion.dart';

class ProductoService {
  Client client = Client();

  Future<List<Producto>> getProductos() async {
    final response = await client.get("$url/productos");
    if (response.statusCode == 200) {
      return productosFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Producto>> getDestacados() async {
    final response = await client.get("$url/categorias/1");
    if (response.statusCode == 200) {
      return productosFromJson1(response.body);
    } else {
      return null;
    }
  }

  Future<List<Producto>> getMenuId(int id) async {
    final response = await client.get("$url/productos/id/$id");
    if (response.statusCode == 200) {
      return menuIdFromJson(response.body);
    } else {
      return null;
    }
  }
}
