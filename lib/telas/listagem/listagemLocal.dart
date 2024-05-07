import 'package:cleanhosp/data/model/local.dart';
import 'package:cleanhosp/telas/cadastro/local/cadastrar_local.dart';
import 'package:cleanhosp/telas/cadastro/local/editar_local.dart';
import 'package:cleanhosp/telas/cadastro/local/localizar_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../data/pdf/gerarPDF.dart';
import '../../data/repositorio/local_repositorio.dart';

class ListagemLocal extends StatefulWidget {
  static final String route = '/listagemLocal';

  @override
  State<ListagemLocal> createState() => _ListagemLocalState();
}

class _ListagemLocalState extends State<ListagemLocal> {

  LocalRepositorio localRepositorio = LocalRepositorio();
  late List<Local> data = [];

  void getLocal() async {
    data = await localRepositorio.getLocais();
    setState(() {});
  }

  void deleteLocal(int id) async {
    await localRepositorio.deleteLocal(id: id);
    setState(() {});
  }

  @override
  void initState() {
    getLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Locais"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getLocal,
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
                    mapItemToString: (Local local) => '${local.local_id}: ${local.ds_descricao}',
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
                  builder: (context) => const LocalizarLocal(),
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
                  builder: (context) => const AddLocal(),
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
                        builder: (context) => EditarLocal(local: data[index])
                    ),
                  );
                },
                leading: Text("${data[index].local_id}"),
                title: Text(data[index].ds_descricao),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    deleteLocal(data[index].local_id);
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
