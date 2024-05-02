import 'package:cleanhosp/data/model/limpeza.dart';
import 'package:cleanhosp/data/repositorio/limpeza_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class localizarLimpeza extends StatefulWidget {
  const localizarLimpeza({super.key});

  @override
  State<localizarLimpeza> createState() => _State();
}

class _State extends State<localizarLimpeza> {

  LimpezaRepositorio limpezaRepositorio = LimpezaRepositorio();
  Limpeza limpeza = const Limpeza.empty();
  TextEditingController textEditingController = TextEditingController();

  void localizarLimpeza(int id) async {
    limpeza = await limpezaRepositorio.getLimpezaPorId(id: id);
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
          localizarLimpeza(int.parse(textEditingController.text));
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
                leading: Text("${limpeza.limpeza_id}"),
                title: Text(limpeza.ds_descricao)
            ),
          ],
        ),
      ),
    );
  }
}
