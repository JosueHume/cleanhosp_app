import 'dart:convert';
import 'package:cleanhosp/data/model/equipamento.dart';
import 'package:http/http.dart' as http;

class EquipamentoRepositorio {
  final String url = "https://localhost:7143/api/Equipamento";

  Future<List<Equipamento>> getEquipamentos() async {
    List<Equipamento> data = [];
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
        data = jsonData.map((json) => Equipamento.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }

  Future<http.Response> updateEquipamento({required Equipamento equipamento, required int id}) async {
    final uri = Uri.parse("$url/$id");
    late http.Response response;

    try {
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(equipamento),
      );
    } catch (e) {
      return response;
    }
    return response;
  }

  Future<http.Response> deleteEquipamento({required int id}) async {
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

  Future<http.Response> addEquipamento({required Equipamento equipamento}) async {
    final uri = Uri.parse(url);
    late http.Response response;

    try {
      response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: json.encode(equipamento),
      );
    } catch (e) {
      return response;
    }

    return response;
  }

  Future<Equipamento> getEquipamentoPorId({required int id}) async {
    final uri = Uri.parse("$url/$id");
    Equipamento? equipamento;

    try {
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        equipamento = Equipamento.fromJson(jsonData);
      }
    } catch (e) {
      return equipamento!;
    }
    return equipamento!;
  }
}
