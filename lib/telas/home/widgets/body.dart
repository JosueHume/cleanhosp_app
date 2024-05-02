import 'package:flutter/material.dart';

import 'navigation_drawer_widget.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xff333C4E),
          width: double.infinity,
          height: double.infinity,
        ),
        Row(
          children: [
            NavigationDrawerWidget(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 46),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60, // Altura do campo de pesquisa
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Espaçamento entre o campo de pesquisa e o título da lista
                    Text(
                      'Limpezas em andamento:', // Título da lista
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20), // Espaçamento entre o título da lista e a listagem
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}