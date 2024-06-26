import 'dart:convert';
import '../model/ala.dart';
import 'package:http/http.dart' as http;

class AlaRepositorio {
  final String url = "https://localhost:7143/api/Ala";

  Future<List<Ala>> getAlas() async {
    List<Ala> data = [];
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
        data = jsonData.map((json) => Ala.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }

  Future<http.Response> updateAla({required Ala ala, required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(ala),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> deleteAla({required int id}) async {
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

  Future<http.Response> addAla({required Ala ala}) async {
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(ala),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  Future<Ala> getAlaPorId({required int id}) async {
    final uri = Uri.parse("$url/$id");
    Ala? ala;

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        ala = Ala.fromJson(jsonData);
      }
    } catch (e) {
      return ala!;
    }
    return ala!;
  }
}
