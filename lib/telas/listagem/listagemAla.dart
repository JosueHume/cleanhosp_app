import 'package:cleanhosp/telas/cadastro/ala/editar_ala.dart';
import 'package:cleanhosp/telas/cadastro/ala/localizar_ala.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cleanhosp/data/model/ala.dart';
import '../../data/pdf/gerarPDF.dart';
import '../../data/repositorio/ala_repositorio.dart';
import '../cadastro/ala/cadastrar_ala.dart';

class ListagemAla extends StatefulWidget {
  static final String route = '/listagemAla';

  @override
  State<ListagemAla> createState() => _ListagemAlaState();
}

class _ListagemAlaState extends State<ListagemAla> {

  AlaRepositorio alaRepositorio = AlaRepositorio();
  late List<Ala> data = [];

  void getAla() async {
      data = await alaRepositorio.getAlas();
      setState(() {});
  }

  void deleteAla(int id) async {
      await alaRepositorio.deleteAla(id: id);
      setState(() {});
  }

  @override
  void initState() {
    getAla();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("Listagem de Alas"),
         centerTitle: true,
         backgroundColor: Colors.blue,
         foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getAla,
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
                    mapItemToString: (Ala ala) => '${ala.ala_id}: ${ala.ds_descricao}',
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
                      builder: (context) => const localizarAla(),
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
                  builder: (context) => const AddAla(),
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
                            builder: (context) => EditarAla(ala: data[index])
                        ),
                    );
                  },
                  leading: Text("${data[index].ala_id}"),
                  title: Text(data[index].ds_descricao),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      deleteAla(data[index].ala_id);
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
