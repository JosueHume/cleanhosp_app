import 'package:cleanhosp/data/repositorio/localLimpeza_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../data/model/local_limpeza.dart';

class AddLocalLimpeza extends StatefulWidget {

  static final String route = '/addLocalLimpeza';
  const AddLocalLimpeza({super.key});

  @override
  State<AddLocalLimpeza> createState() => _AddLocalLimpezaState();
}

class _AddLocalLimpezaState extends State<AddLocalLimpeza> {

  final _formKey = GlobalKey<FormBuilderState>();
  LocalLimpezaRepositorio localLimpezaRepositorio = LocalLimpezaRepositorio();

  void addLocalLimpeza() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final localLimpeza = LocalLimpeza(
        localLimpeza_id: 0,
        ala_id: 0,
        pessoa_id: 0,
        dt_inicio: data['dt_inicio'],
        dt_fim: data['dt_fim'],
        limpeza_id: 0,
        produtos_utilizados_id: 0,
        ds_descricao: data['ds_descricao'],
        status: 0,
      );

      await localLimpezaRepositorio.addLocalLimpeza(localLimpeza: localLimpeza);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro do Local de Limpeza"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: addLocalLimpeza,
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
              //Add o Resto
            ],
          ),
        ),
      ),
    );
  }
}
