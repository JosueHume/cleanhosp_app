import 'dart:convert';
import 'package:cleanhosp/data/model/pessoa.dart';
import 'package:http/http.dart' as http;

class PessoaRepositorio {
  final String url = "https://localhost:7143/api/Pessoa";

  Future<List<Pessoa>> getPessoas() async {
    List<Pessoa> data = [];
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
        data = jsonData.map((json) => Pessoa.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }

  Future<http.Response> updatePessoa({required Pessoa pessoa, required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(pessoa),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> deletePessoa({required int id}) async {
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

  Future<http.Response> addPessoa({required Pessoa pessoa}) async {
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(pessoa),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  Future<Pessoa> getPessoaPorId({required int id}) async {
    final uri = Uri.parse("$url/$id");
    Pessoa? pessoa;

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        pessoa = Pessoa.fromJson(jsonData);
      }
    } catch (e) {
      return pessoa!;
    }
    return pessoa!;
  }
}
