import 'package:cleanhosp/data/model/local.dart';
import 'package:cleanhosp/data/repositorio/local_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddLocal extends StatefulWidget {

  static final String route = '/addLocal';
  const AddLocal({super.key});

  @override
  State<AddLocal> createState() => _AddLocalState();
}

class _AddLocalState extends State<AddLocal> {

  final _formKey = GlobalKey<FormBuilderState>();
  LocalRepositorio localRepositorio = LocalRepositorio();

  void AddLocal() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final local = Local(
        local_id: 0,
        ala_id: 0,
        ds_descricao: data['ds_descricao'],
        //Add o resto
      );

      await localRepositorio.addLocal(local: local);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Locais"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: AddLocal,
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
