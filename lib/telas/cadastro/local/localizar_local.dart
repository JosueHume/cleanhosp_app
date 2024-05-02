import 'package:cleanhosp/data/model/local.dart';
import 'package:cleanhosp/data/repositorio/local_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalizarLocal extends StatefulWidget {
  const LocalizarLocal({super.key});

  @override
  State<LocalizarLocal> createState() => _State();
}

class _State extends State<LocalizarLocal> {

  LocalRepositorio localRepositorio = LocalRepositorio();
  Local local = const Local.empty();
  TextEditingController textEditingController = TextEditingController();

  void localizarLocal(int id) async {
    local = await localRepositorio.getLocalPorId(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localizar Limpeza"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          localizarLocal(int.parse(textEditingController.text));
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
                leading: Text("${local.local_id}"),
                title: Text(local.ds_descricao)
            ),
          ],
        ),
      ),
    );
  }
}
