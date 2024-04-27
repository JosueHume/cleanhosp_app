import 'package:cleanhosp/telas/home/home_screen.dart';
import 'package:flutter/material.dart';

class CadastrarPessoa extends StatelessWidget {
  static final String route = '/cadastrarPessoa';

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Pessoa'),
      ),
      body: Container(
        color: Color(0xff333C4E),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro de Pessoa',
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
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _cpfController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'CPF',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _telefoneController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _loginController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Login',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _senhaController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o botão de cadastro
                  _cadastrarPessoa(context);
                },
                child: Text('Cadastrar Pessoa'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrarPessoa(BuildContext context) {
    // Simulando um cadastro realizado com sucesso
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucesso!'),
            content: Text('Pessoa cadastrada com sucesso!'),
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
