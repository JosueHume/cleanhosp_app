import 'package:cleanhosp/telas/home/home_screen.dart';
import 'package:flutter/material.dart';

class CadastrarLocalLimpeza extends StatefulWidget {
  static final String route = '/cadastrarLocalLimpeza';

  @override
  _CadastrarLocalLimpezaState createState() => _CadastrarLocalLimpezaState();
}

class _CadastrarLocalLimpezaState extends State<CadastrarLocalLimpeza> {
  final TextEditingController _descricaoController = TextEditingController();
  DateTime? _dataInicioSelecionada;
  DateTime? _dataFimSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local da Limpeza'),
      ),
      body: Container(
        color: Color(0xff333C4E),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro do local da Limpeza',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                dropdownColor: Color(0xff333C4E),
                hint: Text('Selecione a Ala', style: TextStyle(color: Colors.white)),
                items: ['Ala A', 'Ala B', 'Ala C']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Ala selecionada: $value');
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Color(0xff333C4E),
                hint: Text('Selecione o Local', style: TextStyle(color: Colors.white)),
                items: ['Local 1', 'Local 2', 'Local 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Local selecionado: $value');
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Color(0xff333C4E),
                hint: Text('Selecione o Tipo de Limpeza', style: TextStyle(color: Colors.white)),
                items: ['Tipo 1', 'Tipo 2', 'Tipo 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Tipo de Limpeza selecionado: $value');
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Color(0xff333C4E),
                hint: Text('Selecione a Pessoa', style: TextStyle(color: Colors.white)),
                items: ['Pessoa 1', 'Pessoa 2', 'Pessoa 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Pessoa selecionada: $value');
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Color(0xff333C4E),
                hint: Text('Selecione os Produtos Utilizados', style: TextStyle(color: Colors.white)),
                items: ['Produto 1', 'Produto 2', 'Produto 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Produtos Utilizados selecionados: $value');
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Color(0xff333C4E),
                hint: Text('Selecione o Equipamento', style: TextStyle(color: Colors.white)),
                items: ['Equipamento 1', 'Equipamento 2', 'Equipamento 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Equipamento selecionado: $value');
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descricaoController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _selecionarDataInicio(context);
                      },
                      child: Text(_dataInicioSelecionada != null
                          ? 'Data de Início: ${_dataInicioSelecionada!.day}/${_dataInicioSelecionada!.month}/${_dataInicioSelecionada!.year}'
                          : 'Selecione a Data de Início'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _selecionarDataFim(context);
                      },
                      child: Text(_dataFimSelecionada != null
                          ? 'Data de Fim: ${_dataFimSelecionada!.day}/${_dataFimSelecionada!.month}/${_dataFimSelecionada!.year}'
                          : 'Selecione a Data de Fim'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _cadastrarLimpeza(context);
                },
                child: Text('Cadastrar Local da Limpeza'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selecionarDataInicio(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (dataSelecionada != null) {
      setState(() {
        _dataInicioSelecionada = dataSelecionada;
      });
    }
  }

  Future<void> _selecionarDataFim(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (dataSelecionada != null) {
      setState(() {
        _dataFimSelecionada = dataSelecionada;
      });
    }
  }

  void _cadastrarLimpeza(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucesso!'),
            content: Text('Local da limpeza cadastrado com sucesso!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
