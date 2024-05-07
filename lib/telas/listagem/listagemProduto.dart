import 'package:cleanhosp/data/model/produto.dart';
import 'package:cleanhosp/data/repositorio/produto_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../data/pdf/gerarPDF.dart';
import '../cadastro/produto/cadastrar_produto.dart';
import '../cadastro/produto/editar_produto.dart';
import '../cadastro/produto/localizar_produto.dart';

class ListagemProduto extends StatefulWidget {
  static final String route = '/listagemProduto';

  @override
  State<ListagemProduto> createState() => _ListagemProdutoState();
}

class _ListagemProdutoState extends State<ListagemProduto> {

  ProdutoRepositorio produtoRepositorio = ProdutoRepositorio();
  late List<Produto> data = [];

  void getProduto() async {
    data = await produtoRepositorio.getProdutos();
    setState(() {});
  }

  void deleteProduto(int id) async {
    await produtoRepositorio.deleteProduto(id: id);
    setState(() {});
  }

  @override
  void initState() {
    getProduto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Produtos"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getProduto,
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
                    mapItemToString: (Produto produto) => '${produto.produto_id}: ${produto.ds_descricao}',
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
                  builder: (context) => const localizarProduto(),
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
                  builder: (context) => const AddProduto(),
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
                        builder: (context) => EditarProduto(produto: data[index])
                    ),
                  );
                },
                leading: Text("${data[index].produto_id}"),
                title: Text(data[index].ds_descricao),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    deleteProduto(data[index].produto_id);
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
