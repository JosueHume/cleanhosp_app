import 'package:cleanhosp/telas/home/home_screen.dart';
import 'package:flutter/material.dart';

class CadastrarAla extends StatelessWidget {
  static final String route = '/cadastrarAla';

  final TextEditingController _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Ala'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff333C4E), // Define o background para a cor desejada
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro de Ala',
                style: TextStyle(
                  color: Colors.white, // Cor da fonte branca
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: TextField(
                    controller: _descricaoController,
                    maxLines: null, // Permitirá um número indefinido de linhas
                    decoration: InputDecoration(
                      border: OutlineInputBorder(), // Adicione uma borda para melhorar a aparência
                      labelText: 'Descrição da Ala...',
                      labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                    ),
                    style: TextStyle(color: Colors.white), // Cor do texto do input
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o botão de cadastro
                  _cadastrarAla(context);
                },
                child: Text('Cadastrar Ala'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrarAla(BuildContext context) {
    // Simulando um cadastro realizado com sucesso
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucesso!'),
            content: Text('Ala cadastrada com sucesso!'),
            actions: [
              TextButton(
                onPressed: () {
                  // Fechar o modal
                  Navigator.of(context).pop();
                  // Navegar de volta à página inicial com a rota 'home'
                  Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }
}
