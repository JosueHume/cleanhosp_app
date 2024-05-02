
import 'package:cleanhosp/data/repositorio/equipamento_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import '../../../data/model/equipamento.dart';

class AddEquipamento extends StatefulWidget {

  static final String route = '/addEquipamento';
  const AddEquipamento({super.key});

  @override
  State<AddEquipamento> createState() => _AddEquipamentoState();
}

class _AddEquipamentoState extends State<AddEquipamento> {

  final _formKey = GlobalKey<FormBuilderState>();
  EquipamentoRepositorio equipamentoRepositorio = EquipamentoRepositorio();

  void addEquipamento() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final equipamento = Equipamento(
        equipamento_id: 0,
        ds_nome: data['ds_nome'],
        ds_marca: data['ds_marca'],
        ds_modelo: data['ds_modelo'],
        dt_aquisicao: data['dt_aquisicao'],
        ds_descricao: data['ds_descricao'],
        xAtivo: data['xAtivo'],
      );

      await equipamentoRepositorio.addEquipamento(equipamento: equipamento);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Equipamentos"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: addEquipamento,
        child: const Text('Cadastrar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
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
              FormBuilderTextField(
                name: 'dt_aquisicao',
                decoration: const InputDecoration(labelText: 'Data de Aquisição: '),
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

