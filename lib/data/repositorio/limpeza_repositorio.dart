import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/limpeza.dart';

class LimpezaRepositorio {
  final String url = "https://localhost:7143/api/Limpeza";

  Future<List<Limpeza>> getLimpezas() async {
    List<Limpeza> data = [];
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
        data = jsonData.map((json) => Limpeza.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }

  Future<http.Response> updateLimpeza({required Limpeza limpeza, required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(limpeza),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> deleteLimpeza({required int id}) async {
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

  Future<http.Response> addLimpeza({required Limpeza limpeza}) async {
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(limpeza),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  Future<Limpeza> getLimpezaPorId({required int id}) async {
    final uri = Uri.parse("$url/$id");
    Limpeza? limpeza;

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        limpeza = Limpeza.fromJson(jsonData);
      }
    } catch (e) {
      return limpeza!;
    }
    return limpeza!;
  }
}
