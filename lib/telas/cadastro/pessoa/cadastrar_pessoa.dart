
import 'package:cleanhosp/data/model/pessoa.dart';
import 'package:cleanhosp/data/repositorio/pessoa_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddPessoa extends StatefulWidget {

  static final String route = '/addPessoa';
  const AddPessoa({super.key});

  @override
  State<AddPessoa> createState() => _AddPessoaState();
}

class _AddPessoaState extends State<AddPessoa> {

  final _formKey = GlobalKey<FormBuilderState>();
  PessoaRepositorio pessoaRepositorio = PessoaRepositorio();

  void addPessoa() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final pessoa = Pessoa(
          pessoa_id: 0,
          ds_nome: data['ds_nome'],
          nr_cpf: data['nr_cpf'],
          nr_telefone: data['nr_telefone'],
          ds_email: data['ds_email'],
          ds_login: data['ds_login'],
          ds_senha: data['ds_senha'],
      );

      await pessoaRepositorio.addPessoa(pessoa: pessoa);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Pessoa"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: addPessoa,
        child: const Text('Cadastrar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
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
