import 'package:cleanhosp/telas/home/home_screen.dart';
import 'package:flutter/material.dart';

class CadastrarProduto extends StatelessWidget {
  static final String route = '/cadastrarProduto';

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _quantidadeEstoqueController = TextEditingController();
  final TextEditingController _valorUnitarioController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto'),
      ),
      body: Container(
        color: Color(0xff333C4E),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro de Produto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nomeController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Nome do Produto',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _marcaController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Marca',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _quantidadeEstoqueController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Quantidade em Estoque',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _valorUnitarioController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Valor Unitário',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _descricaoController,
                style: TextStyle(color: Colors.white),
                maxLines: null, // Permitirá um número indefinido de linhas
                decoration: InputDecoration(
                  labelText: 'Descrição do Produto',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o botão de cadastro
                  _cadastrarProduto(context);
                },
                child: Text('Cadastrar Produto'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrarProduto(BuildContext context) {
    // Simulando um cadastro realizado com sucesso
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucesso!'),
            content: Text('Produto cadastrado com sucesso!'),
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
