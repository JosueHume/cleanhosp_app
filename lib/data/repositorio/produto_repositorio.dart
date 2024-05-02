import 'dart:convert';
import 'package:cleanhosp/data/model/produto.dart';
import 'package:http/http.dart' as http;

class ProdutoRepositorio {
  final String url = "https://localhost:7143/api/Produto";

  Future<List<Produto>> getProdutos() async {
    List<Produto> data = [];
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
        data = jsonData.map((json) => Produto.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }

  Future<http.Response> updateProduto({required Produto produto, required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(produto),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> deleteProduto({required int id}) async {
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

  Future<http.Response> addProduto({required Produto produto}) async {
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(produto),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  Future<Produto> getProdutoPorId({required int id}) async {
    final uri = Uri.parse("$url/$id");
    Produto? produto;

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        produto = Produto.fromJson(jsonData);
      }
    } catch (e) {
      return produto!;
    }
    return produto!;
  }
}
