import 'package:cleanhosp/data/repositorio/limpeza_repositorio.dart';
import 'package:cleanhosp/telas/cadastro/limpeza/localizar_limpeza.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/limpeza.dart';
import '../../data/pdf/gerarPDF.dart';
import '../cadastro/limpeza/cadastrar_limpeza.dart';
import '../cadastro/limpeza/editar_limpeza.dart';

class ListagemLimpeza extends StatefulWidget {
  static final String route = '/listagemLimpeza';

  @override
  State<ListagemLimpeza> createState() => _ListagemLimpezaState();
}

class _ListagemLimpezaState extends State<ListagemLimpeza> {

  LimpezaRepositorio limpezaRepositorio = LimpezaRepositorio();
  late List<Limpeza> data = [];

  void getLimpeza() async {
    data = await limpezaRepositorio.getLimpezas();
    setState(() {});
  }

  void deleteLimpeza(int id) async {
    await limpezaRepositorio.deleteLimpeza(id: id);
    setState(() {});
  }

  @override
  void initState() {
    getLimpeza();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Limpezas"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getLimpeza,
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
                    mapItemToString: (Limpeza limpeza) => '${limpeza.limpeza_id}: ${limpeza.ds_descricao}',
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
                  builder: (context) => const localizarLimpeza(),
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
                  builder: (context) => const AddLimpeza(),
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
                        builder: (context) => EditarLimpeza(limpeza: data[index])
                    ),
                  );
                },
                leading: Text("${data[index].limpeza_id}"),
                title: Text(data[index].ds_descricao),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    deleteLimpeza(data[index].limpeza_id);
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
