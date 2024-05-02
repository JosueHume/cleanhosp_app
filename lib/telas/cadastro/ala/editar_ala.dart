import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cleanhosp/data/model/ala.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

import '../../../data/repositorio/ala_repositorio.dart';

class EditarAla extends StatefulWidget {

  final Ala ala;
  const EditarAla({super.key, required this.ala});

  @override
  State<EditarAla> createState() => _EditarAlaState();
}

class _EditarAlaState extends State<EditarAla> {

  final _formKey = GlobalKey<FormBuilderState>();
  AlaRepositorio alaRepositorio = AlaRepositorio();
  late http.Response response;

  void updateAla() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final ala = Ala(
        ala_id: widget.ala.ala_id,
        ds_descricao: data['ds_descricao'],
      );
      
      response = await alaRepositorio.updateAla(
          ala: ala,
          id: widget.ala.ala_id
      );
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Ala"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: updateAla,
        child: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'ds_descricao' : widget.ala.ds_descricao,
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
            ],
          ),
        ),
      ),
    );
  }
}
