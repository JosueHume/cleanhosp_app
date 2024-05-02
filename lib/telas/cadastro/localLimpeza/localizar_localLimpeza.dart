import 'package:cleanhosp/data/model/ala.dart';
import 'package:cleanhosp/data/model/local_limpeza.dart';
import 'package:cleanhosp/data/repositorio/localLimpeza_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/repositorio/ala_repositorio.dart';

class LocalizarLocalLimpeza extends StatefulWidget {
  const LocalizarLocalLimpeza({super.key});

  @override
  State<LocalizarLocalLimpeza> createState() => _State();
}

class _State extends State<LocalizarLocalLimpeza> {

  LocalLimpezaRepositorio localLimpezaRepositorio = LocalLimpezaRepositorio();
  LocalLimpeza localLimpeza = const LocalLimpeza.empty();
  TextEditingController textEditingController = TextEditingController();

  void LocalizarLocalLimpeza(int id) async {
    localLimpeza = await localLimpezaRepositorio.getLocalPorId(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localizar Local de Limpeza"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          LocalizarLocalLimpeza(int.parse(textEditingController.text));
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
                leading: Text("${localLimpeza.localLimpeza_id}"),
                title: Text(localLimpeza.ds_descricao)
            ),
          ],
        ),
      ),
    );
  }
}
