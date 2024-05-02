import 'package:cleanhosp/data/model/local.dart';
import 'package:cleanhosp/data/repositorio/local_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

class EditarLocal extends StatefulWidget {

  final Local local;
  const EditarLocal({super.key, required this.local});

  @override
  State<EditarLocal> createState() => _EditarLocalState();
}

class _EditarLocalState extends State<EditarLocal> {

  final _formKey = GlobalKey<FormBuilderState>();
  LocalRepositorio localRepositorio = LocalRepositorio();
  late http.Response response;

  void updateLocal() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final local = Local(
        local_id: widget.local.local_id,
        ala_id: 0,
        ds_descricao: data['ds_descricao'],
      );

      response = await localRepositorio.updateLocal(
          local: local,
          id: widget.local.local_id
      );
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Local"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: updateLocal,
        child: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'ds_descricao' : widget.local.ds_descricao,
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
