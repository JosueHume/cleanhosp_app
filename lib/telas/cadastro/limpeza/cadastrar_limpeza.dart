import 'package:cleanhosp/data/model/limpeza.dart';
import 'package:cleanhosp/data/repositorio/limpeza_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddLimpeza extends StatefulWidget {

  static final String route = '/addLimpeza';
  const AddLimpeza({super.key});

  @override
  State<AddLimpeza> createState() => _AddLimpezaState();
}

class _AddLimpezaState extends State<AddLimpeza> {

  final _formKey = GlobalKey<FormBuilderState>();
  LimpezaRepositorio limpezaRepositorio = LimpezaRepositorio();

  void AddLimpeza() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final limpeza = Limpeza(
        limpeza_id: 0,
        ds_descricao: data['ds_descricao'],
        //Add o resto
      );

      await limpezaRepositorio.addLimpeza(limpeza: limpeza);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Limpezas"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: AddLimpeza,
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
