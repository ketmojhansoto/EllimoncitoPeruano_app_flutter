import 'package:http/http.dart' show Client;

import 'package:ellimoncito_peruano/src/models/oferta.dart';
import 'conexion.dart';

class OfertaService {
  Client client = Client();

  // Future<List<Oferta>> getOfertas() async {
  //   final response = await client.get("$url/ofertas");
  //   if (response.statusCode == 200) {
  //     return ofertasFromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }
}
