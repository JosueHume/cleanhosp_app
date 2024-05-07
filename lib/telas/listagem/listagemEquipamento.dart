import 'package:cleanhosp/data/model/equipamento.dart';
import 'package:cleanhosp/data/repositorio/equipamento_repositorio.dart';
import 'package:cleanhosp/telas/cadastro/equipamento/localizar_equipamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../data/pdf/gerarPDF.dart';
import '../cadastro/equipamento/cadastrar_equipamento.dart';
import '../cadastro/equipamento/editar_equipamento.dart';

class ListagemEquipamento extends StatefulWidget {
  static final String route = '/listagemEquipamento';

  @override
  State<ListagemEquipamento> createState() => _ListagemEquipamentoState();
}

class _ListagemEquipamentoState extends State<ListagemEquipamento> {

  EquipamentoRepositorio equipamentoRepositorio = EquipamentoRepositorio();
  late List<Equipamento> data = [];

  void getEquipamento() async {
    data = await equipamentoRepositorio.getEquipamentos();
    setState(() {});
  }

  void deleteEquipamento(int id) async {
    await equipamentoRepositorio.deleteEquipamento(id: id);
    setState(() {});
  }

  @override
  void initState() {
    getEquipamento();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Equipamentos"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getEquipamento,
        child: const Text('Atualizar'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFGerador(
                    dados: data,
                    mapItemToString: (Equipamento equipamento) => '${equipamento.equipamento_id}: ${equipamento.ds_descricao}',
                  ),
                ),
              );
            },
            child: const Icon(Icons.print),
          ),
          const SizedBox(
              height: 10
          ),
          FloatingActionButton(
            heroTag: 2,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LocalizarEquipamento(),
                ),
              );
            },
            child: const Icon(Icons.search),
          ),
          const SizedBox(
              height: 10
          ),
          FloatingActionButton(
            heroTag: 3,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEquipamento(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index)
            {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditarEquipamento(equipamento: data[index])
                    ),
                  );
                },
                leading: Text("${data[index].equipamento_id}"),
                title: Text(data[index].ds_descricao),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    deleteEquipamento(data[index].equipamento_id);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
