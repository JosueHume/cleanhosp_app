import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/local_limpeza.dart';

class LocalLimpezaRepositorio {
  final String url = "https://localhost:7143/api/LocalLimpeza";

  Future<List<LocalLimpeza>> getLocaisLimpezas() async {
    List<LocalLimpeza> data = [];
    final uri = Uri.parse(url);

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final List<dynamic> jsonData = json.decode(response.body);
        data = jsonData.map((json) => LocalLimpeza.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }

  Future<http.Response> updateLocalLimpeza({required LocalLimpeza localLimpeza, required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(localLimpeza),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> deleteLocalLimpeza({required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> addLocalLimpeza({required LocalLimpeza localLimpeza}) async {
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(localLimpeza),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  Future<LocalLimpeza> getLocalPorId({required int id}) async {
    final uri = Uri.parse("$url/$id");
    LocalLimpeza? localLimpeza;

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        localLimpeza = LocalLimpeza.fromJson(jsonData);
      }
    } catch (e) {
      return localLimpeza!;
    }
    return localLimpeza!;
  }
}
