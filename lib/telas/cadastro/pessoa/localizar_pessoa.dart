import 'package:cleanhosp/data/model/ala.dart';
import 'package:cleanhosp/data/model/pessoa.dart';
import 'package:cleanhosp/data/repositorio/pessoa_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/repositorio/ala_repositorio.dart';

class localizarPessoa extends StatefulWidget {
  const localizarPessoa({super.key});

  @override
  State<localizarPessoa> createState() => _State();
}

class _State extends State<localizarPessoa> {

  PessoaRepositorio pessoaRepositorio = PessoaRepositorio();
  Pessoa pessoa = const Pessoa.empty();
  TextEditingController textEditingController = TextEditingController();

  void localizarPessoa(int id) async {
    pessoa = await pessoaRepositorio.getPessoaPorId(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localizar Pessoa"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          localizarPessoa(int.parse(textEditingController.text));
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
                leading: Text("${pessoa.pessoa_id}"),
                title: Text(pessoa.ds_nome)
            ),
          ],
        ),
      ),
    );
  }
}
