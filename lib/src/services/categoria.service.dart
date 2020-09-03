import 'package:http/http.dart' show Client;

import 'package:ellimoncito_peruano/src/models/Categoria.dart';
import 'conexion.dart';

class CategoriaService {
  Client client = Client();

  Future<List<Categoria>> getCategorias() async {
    final response = await client.get("$url/categorias");
    if (response.statusCode == 200) {
      return categoriasFromJson(response.body);
    } else {
      return null;
    }
  }
}
