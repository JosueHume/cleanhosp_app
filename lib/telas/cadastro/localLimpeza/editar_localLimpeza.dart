import 'package:cleanhosp/data/model/local_limpeza.dart';
import 'package:cleanhosp/data/repositorio/localLimpeza_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

class EditarLocalLimpeza extends StatefulWidget {

  final LocalLimpeza localLimpeza;
  const EditarLocalLimpeza({super.key, required this.localLimpeza});

  @override
  State<EditarLocalLimpeza> createState() => _EditarLocalLimpezaState();
}

class _EditarLocalLimpezaState extends State<EditarLocalLimpeza> {

  final _formKey = GlobalKey<FormBuilderState>();
  LocalLimpezaRepositorio localLimpezaRepositorio = LocalLimpezaRepositorio();
  late http.Response response;

  void updateAla() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final localLimpeza = LocalLimpeza(
        localLimpeza_id: widget.localLimpeza.localLimpeza_id,
        ala_id: widget.localLimpeza.ala_id,
        pessoa_id: widget.localLimpeza.pessoa_id,
        dt_inicio: widget.localLimpeza.dt_inicio,
        dt_fim: widget.localLimpeza.dt_fim,
        limpeza_id: widget.localLimpeza.limpeza_id,
        produtos_utilizados_id: widget.localLimpeza.produtos_utilizados_id,
        status: widget.localLimpeza.status,
        ds_descricao: data['ds_descricao'],
      );

      response = await localLimpezaRepositorio.updateLocalLimpeza(
          localLimpeza: localLimpeza,
          id: widget.localLimpeza.localLimpeza_id
      );
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Local da Limpeza"),
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
            'ds_descricao' : widget.localLimpeza.ds_descricao,
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
              //Add o Resto
            ],
          ),
        ),
      ),
    );
  }
}
