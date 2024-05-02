
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../data/model/ala.dart';
import '../../../data/repositorio/ala_repositorio.dart';

class AddAla extends StatefulWidget {

  static final String route = '/addAla';
  const AddAla({super.key});

  @override
  State<AddAla> createState() => _AddAlaState();
}

class _AddAlaState extends State<AddAla> {

  final _formKey = GlobalKey<FormBuilderState>();
  AlaRepositorio alaRepositorio = AlaRepositorio();

  void addAla() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final ala = Ala(
        ala_id: 0,
        ds_descricao: data['ds_descricao'],
      );

      await alaRepositorio.addAla(ala: ala);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Alas"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: addAla,
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
            ],
          ),
        ),
      ),
    );
  }
}
