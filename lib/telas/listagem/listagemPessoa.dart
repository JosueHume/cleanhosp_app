import 'package:cleanhosp/data/model/pessoa.dart';
import 'package:cleanhosp/data/repositorio/pessoa_repositorio.dart';
import 'package:cleanhosp/telas/cadastro/pessoa/cadastrar_pessoa.dart';
import 'package:cleanhosp/telas/cadastro/pessoa/editar_pessoa.dart';
import 'package:cleanhosp/telas/cadastro/pessoa/localizar_pessoa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListagemPessoa extends StatefulWidget {
  static final String route = '/listagemPessoa';

  @override
  State<ListagemPessoa> createState() => _ListagemPessoaState();
}

class _ListagemPessoaState extends State<ListagemPessoa> {

  PessoaRepositorio pessoaRepositorio = PessoaRepositorio();
  late List<Pessoa> data = [];

  void getPessoa() async {
    data = await pessoaRepositorio.getPessoas();
    setState(() {});
  }

  void deletePessoa(int id) async {
    await pessoaRepositorio.deletePessoa(id: id);
    setState(() {});
  }

  @override
  void initState() {
    getPessoa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Pessoas"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getPessoa,
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
                  builder: (context) => const localizarPessoa(),
                ),
              );
            },
            child: const Icon(Icons.search),
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
                  builder: (context) => const AddPessoa(),
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
                        builder: (context) => EditarPessoa(pessoa: data[index])
                    ),
                  );
                },
                leading: Text("${data[index].pessoa_id}"),
                title: Text(data[index].ds_nome),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    deletePessoa(data[index].pessoa_id);
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
