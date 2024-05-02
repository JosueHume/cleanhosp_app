import 'package:cleanhosp/data/model/limpeza.dart';
import 'package:cleanhosp/data/repositorio/limpeza_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

class EditarLimpeza extends StatefulWidget {

  final Limpeza limpeza;
  const EditarLimpeza({super.key, required this.limpeza});

  @override
  State<EditarLimpeza> createState() => _EditarLimpezaState();
}

class _EditarLimpezaState extends State<EditarLimpeza> {

  final _formKey = GlobalKey<FormBuilderState>();
  LimpezaRepositorio limpezaRepositorio = LimpezaRepositorio();
  late http.Response response;

  void updateLimpeza() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final limpeza = Limpeza(
        limpeza_id: widget.limpeza.limpeza_id,
        ds_descricao: data['ds_descricao'],
        //Add o Resto
      );

      response = await limpezaRepositorio.updateLimpeza(
          limpeza: limpeza,
          id: widget.limpeza.limpeza_id
      );
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Limpeza"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: updateLimpeza,
        child: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'ds_descricao' : widget.limpeza.ds_descricao,
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
