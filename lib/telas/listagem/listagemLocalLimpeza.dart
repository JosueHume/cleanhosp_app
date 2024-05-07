import 'package:cleanhosp/data/repositorio/localLimpeza_repositorio.dart';
import 'package:cleanhosp/telas/cadastro/localLimpeza/cadastrar_localLimpeza.dart';
import 'package:cleanhosp/telas/cadastro/localLimpeza/editar_localLimpeza.dart';
import 'package:cleanhosp/telas/cadastro/localLimpeza/localizar_localLimpeza.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../data/model/local_limpeza.dart';
import '../../data/pdf/gerarPDF.dart';

class ListagemLocalLimpeza extends StatefulWidget {
  static final String route = '/localLimpeza';

  @override
  State<ListagemLocalLimpeza> createState() => _ListagemLocalLimpezaState();
}

class _ListagemLocalLimpezaState extends State<ListagemLocalLimpeza> {

  LocalLimpezaRepositorio localLimpezaRepositorio = LocalLimpezaRepositorio();
  late List<LocalLimpeza> data = [];

  void getLocalLimpeza() async {
    data = await localLimpezaRepositorio.getLocaisLimpezas();
    setState(() {});
  }

  void deleteLocalLimpeza(int id) async {
    await localLimpezaRepositorio.deleteLocalLimpeza(id: id);
    setState(() {});
  }

  @override
  void initState() {
    getLocalLimpeza();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Locais de Limpeza"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getLocalLimpeza,
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
                    mapItemToString: (LocalLimpeza localLimpeza) => '${localLimpeza.localLimpeza_id}: ${localLimpeza.ds_descricao}',
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
                  builder: (context) => const LocalizarLocalLimpeza(),
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
                  builder: (context) => const AddLocalLimpeza(),
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
                        builder: (context) => EditarLocalLimpeza(localLimpeza: data[index])
                    ),
                  );
                },
                leading: Text("${data[index].localLimpeza_id}"),
                title: Text(data[index].ds_descricao),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    deleteLocalLimpeza(data[index].localLimpeza_id);
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
