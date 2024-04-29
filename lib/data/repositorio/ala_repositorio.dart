
import 'dart:convert';

import 'package:cleanhosp/data/http/exception.dart';

import '../model/ala.dart';
import 'package:cleanhosp/data/http/http_client.dart';

abstract class IAlaRepositorio {
    Future<List<AlaModel>> getAlas();
}

class AlaRepositorio implements IAlaRepositorio {

  final IHttpClient client;

  AlaRepositorio({required this.client});

  @override
  Future<List<AlaModel>> getAlas() async {
    final response = await client.get(
        url: 'https://localhost:7143/api/Ala'
    );

    if(response.statusCode == 200)
    {
      final List<AlaModel> alas = [];
      final body = jsonDecode(response.body);

      body['alas'].map((item) {
          final AlaModel ala = AlaModel.fromMap(item);
          alas.add(ala);
      }).toList();

      return alas;
    } else if(response.status == 404) {
        throw NotFoundException('A url informada não é válida');
    } else {
        throw Exception('Não foi possível carregas as alas.');
    }
  }
}