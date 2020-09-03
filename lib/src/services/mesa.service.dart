import 'package:http/http.dart' show Client;
import 'package:ellimoncito_peruano/src/models/mesa.dart';
import 'conexion.dart';

class MesaService {
  Client client = Client();

  Future<List<Mesas>> getMesas() async {
    final response = await client.get("$url/mesas");
    if (response.statusCode == 200) {
      return mesasFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Mesas> getMesaQr(String codigo) async {
    final response = await client.get("$url/mesas");
    if (response.statusCode == 200) {
      List<Mesas> mesas = mesasFromJson(response.body);
      Mesas mesaEncontrada;
      for (var item in mesas) {
        Mesas mesa = item;
        if (mesa.codigoQR == codigo) {
          mesaEncontrada = mesa;
        }
      }
      return mesaEncontrada;
    } else {
      return null;
    }
  }
}
