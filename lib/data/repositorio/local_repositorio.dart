import 'dart:convert';
import 'package:cleanhosp/data/model/local.dart';
import 'package:http/http.dart' as http;

class LocalRepositorio {
  final String url = "https://localhost:7143/api/Local";

  Future<List<Local>> getLocais() async {
    List<Local> data = [];
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
        data = jsonData.map((json) => Local.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }

  Future<http.Response> updateLocal({required Local local, required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(local),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> deleteLocal({required int id}) async {
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

  Future<http.Response> addLocal({required Local local}) async {
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(local),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  Future<Local> getLocalPorId({required int id}) async {
    final uri = Uri.parse("$url/$id");
    Local? local;

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        local = Local.fromJson(jsonData);
      }
    } catch (e) {
      return local!;
    }
    return local!;
  }
}
