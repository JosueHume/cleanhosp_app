import 'package:cleanhosp/data/model/ala.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/repositorio/ala_repositorio.dart';

class localizarAla extends StatefulWidget {
  const localizarAla({super.key});

  @override
  State<localizarAla> createState() => _State();
}

class _State extends State<localizarAla> {

  AlaRepositorio alaRepositorio = AlaRepositorio();
  Ala ala = const Ala.empty();
  TextEditingController textEditingController = TextEditingController();

  void localizarAla(int id) async {
    ala = await alaRepositorio.getAlaPorId(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localizar Ala"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          localizarAla(int.parse(textEditingController.text));
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
                leading: Text("${ala.ala_id}"),
                title: Text(ala.ds_descricao)
              ),
          ],
        ),
      ),
    );
  }
}
