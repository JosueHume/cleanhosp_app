import 'package:cleanhosp/data/model/produto.dart';
import 'package:cleanhosp/data/repositorio/produto_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class localizarProduto extends StatefulWidget {
  const localizarProduto({super.key});

  @override
  State<localizarProduto> createState() => _State();
}

class _State extends State<localizarProduto> {

  ProdutoRepositorio produtoRepositorio = ProdutoRepositorio();
  Produto produto = const Produto.empty();
  TextEditingController textEditingController = TextEditingController();

  void localizarProduto(int id) async {
    produto = await produtoRepositorio.getProdutoPorId(id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localizar Produto"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: () {
          localizarProduto(int.parse(textEditingController.text));
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
                leading: Text("${produto.produto_id}"),
                title: Text(produto.ds_nome)
            ),
            //Add o resto
          ],
        ),
      ),
    );
  }
}
