import 'package:cleanhosp/data/model/pessoa.dart';
import 'package:cleanhosp/data/repositorio/pessoa_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

class EditarPessoa extends StatefulWidget {

  final Pessoa pessoa;
  const EditarPessoa({super.key, required this.pessoa});

  @override
  State<EditarPessoa> createState() => _EditarPessoaState();
}

class _EditarPessoaState extends State<EditarPessoa> {

  final _formKey = GlobalKey<FormBuilderState>();
  PessoaRepositorio pessoaRepositorio = PessoaRepositorio();
  late http.Response response;

  void updatePessoa() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final pessoa = Pessoa(
        pessoa_id: widget.pessoa.pessoa_id,
        ds_nome: data['ds_nome'],
        nr_cpf: data['nr_cpf'],
        nr_telefone: data['nr_telefone'],
        ds_email: data['ds_email'],
        ds_login: data['ds_login'],
        ds_senha: data['ds_senha'],
      );

      response = await pessoaRepositorio.updatePessoa(
          pessoa: pessoa,
          id: widget.pessoa.pessoa_id
      );
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Pessoa"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: updatePessoa,
        child: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'ds_descricao' : widget.pessoa.ds_nome,
          },
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'ds_descricao',
                decoration: const InputDecoration(labelText: 'Descrição: '),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required()
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              //Add o resto
            ],
          ),
        ),
      ),
    );
  }
}
