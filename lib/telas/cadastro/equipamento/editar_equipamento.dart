import 'package:cleanhosp/data/model/equipamento.dart';
import 'package:cleanhosp/data/repositorio/equipamento_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class EditarEquipamento extends StatefulWidget {

  final Equipamento equipamento;
  const EditarEquipamento({super.key, required this.equipamento});

  @override
  State<EditarEquipamento> createState() => _EditarEquipamentoState();
}

class _EditarEquipamentoState extends State<EditarEquipamento> {

  final _formKey = GlobalKey<FormBuilderState>();
  EquipamentoRepositorio equipamentoRepositorio = EquipamentoRepositorio();
  late http.Response response;

  void updateEquipamento() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final equipamento = Equipamento(
        equipamento_id: widget.equipamento.equipamento_id,
        ds_nome: data['ds_nome'],
        ds_marca: data['ds_marca'],
        ds_modelo: data['ds_modelo'],
        dt_aquisicao: data['dt_aquisicao'],
        ds_descricao: data['ds_descricao'],
        xAtivo: data['xAtivo'],
      );

      response = await equipamentoRepositorio.updateEquipamento(
          equipamento: equipamento,
          id: widget.equipamento.equipamento_id
      );
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Equipamento"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: updateEquipamento,
        child: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'ds_nome' : widget.equipamento.ds_nome,
            'ds_marca' : widget.equipamento.ds_marca,
            'ds_modelo' : widget.equipamento.ds_modelo,
            'dt_aquisicao' : widget.equipamento.dt_aquisicao,
            'ds_descricao' : widget.equipamento.ds_descricao,
            'xAtivo' : widget.equipamento.xAtivo,
          },
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'ds_nome',
                decoration: const InputDecoration(labelText: 'Nome: '),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required()
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                name: 'ds_marca',
                decoration: const InputDecoration(labelText: 'Marca: '),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required()
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                name: 'ds_modelo',
                decoration: const InputDecoration(labelText: 'Modelo: '),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required()
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderDateTimePicker(
                name: 'dt_aquisicao',
                decoration: const InputDecoration(labelText: 'Data de Aquisição: '),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                inputType: InputType.date, // Define o tipo de entrada como data
                format: DateFormat('dd/MM/yyyy'),
              ),
              const SizedBox(
                height: 10,
              ),
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
              FormBuilderCheckbox(
                name: 'xAtivo',
                title: Text('Ativo'),
                initialValue: false,
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
