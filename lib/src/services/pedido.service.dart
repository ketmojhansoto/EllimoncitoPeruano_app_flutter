import 'package:http/http.dart' show Client;
import 'package:ellimoncito_peruano/src/models/pedido.dart';
import 'dart:async';
import 'conexion.dart';

class PedidoService {
  Client client = Client();

  // Future<Pedido> createPost({Map body}) async {
  //   return http
  //       .post('$url/pedidos', body: json.encode(body))
  //       .then((http.Response response) {
  //     final int statusCode = response.statusCode;

  //     if (statusCode == 201) {
  //       return Pedido.fromJson(json.decode(response.body));
  //     } else {
  //       return null;
  //     }
  //   });
  // }

  Future<bool> createPedido(Pedido pedido) async {
    final response = await client.post(
      "$url/pedidos",
      headers: {"content-type": "application/json"},
      body: postToJson(pedido),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // Future<APIResponse<bool>> createPost(PedidoManipulation item) {
  //   return http.post(url + '/pedidos', body: json.encode(item.toJson())).then((data) {
  //     if (data.statusCode == 201) {
  //       return APIResponse<bool>(data: true);
  //     }
  //     return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  //   })
  //   .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  // }
}
