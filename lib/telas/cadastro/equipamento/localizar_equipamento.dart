import 'package:cleanhosp/data/model/ala.dart';
import 'package:cleanhosp/data/model/equipamento.dart';
import 'package:cleanhosp/data/repositorio/equipamento_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/repositorio/ala_repositorio.dart';

class LocalizarEquipamento extends StatefulWidget {
  const LocalizarEquipamento({super.key});

  @override
  State<LocalizarEquipamento> createState() => _State();
}

class _State extends State<LocalizarEquipamento> {

  EquipamentoRepositorio equipamentoRepositorio = EquipamentoRepositorio();
  Equipamento equipamento = const Equipamento.empty();
  TextEditingController textEditingController = TextEditingController();

  void localizarEquipamento(int id) async {
    equipamento = await equipamentoRepositorio.getEquipamentoPorId(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localizar Equipamento"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          localizarEquipamento(int.parse(textEditingController.text));
        },
        child: const Text('Localizar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
            ),
            SizedBox(
              height: 100,),
            ListTile(
                leading: Text("${equipamento.equipamento_id}"),
                title: Text(equipamento.ds_nome)
            ),
          ],
        ),
      ),
    );
  }
}
