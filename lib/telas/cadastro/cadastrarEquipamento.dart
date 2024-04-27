import 'package:cleanhosp/telas/home/home_screen.dart';
import 'package:flutter/material.dart';

class CadastrarEquipamento extends StatefulWidget {

  static final String route = '/cadastrarEquipamento';

  @override
  _CadastrarEquipamentoState createState() => _CadastrarEquipamentoState();
}

class _CadastrarEquipamentoState extends State<CadastrarEquipamento> {

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _dataAquisicaoController = TextEditingController();
  final TextEditingController _valorAquisicaoController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  bool _ativo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamento'),
      ),
      body: Container(
        color: Color(0xff333C4E), // Define a cor de fundo
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro de Equipamento',
                style: TextStyle(
                  color: Colors.white, // Cor do texto
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nomeController,
                style: TextStyle(color: Colors.white), // Cor do texto do input
                decoration: InputDecoration(
                  labelText: 'Nome do Equipamento',
                  labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _marcaController,
                style: TextStyle(color: Colors.white), // Cor do texto do input
                decoration: InputDecoration(
                  labelText: 'Marca do Equipamento',
                  labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dataAquisicaoController,
                style: TextStyle(color: Colors.white), // Cor do texto do input
                decoration: InputDecoration(
                  labelText: 'Data de Aquisição',
                  labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _valorAquisicaoController,
                style: TextStyle(color: Colors.white), // Cor do texto do input
                decoration: InputDecoration(
                  labelText: 'Valor da Aquisição',
                  labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _descricaoController,
                style: TextStyle(color: Colors.white), // Cor do texto do input
                maxLines: null, // Permitirá um número indefinido de linhas
                decoration: InputDecoration(
                  labelText: 'Descrição do Equipamento',
                  labelStyle: TextStyle(color: Colors.white), // Cor do texto do label
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Ativo:',
                    style: TextStyle(color: Colors.white), // Cor do texto
                  ),
                  Checkbox(
                    value: _ativo,
                    onChanged: (bool? value) {
                      setState(() {
                        // Atualiza o estado do campo "ativo" quando o usuário alterar o checkbox
                        _ativo = value ?? false; // Se o valor for nulo, assume false
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ação ao pressionar o botão de cadastro
                  _cadastrarEquipamento(context);
                },
                child: Text('Cadastrar Equipamento'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrarEquipamento(BuildContext context) {
    // Simulando um cadastro realizado com sucesso
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucesso!'),
            content: Text('Equipamento cadastrado com sucesso!'),
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
