import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetLimpezas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1, // Apenas um item por linha
      children: List.generate(
        10, // Número de itens na listagem
            (index) => Padding(
          padding: const EdgeInsets.only(bottom: 10), // Espaçamento inferior entre os itens
          child: Container(
            color: Colors.blue, // Cor de fundo dos itens
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}