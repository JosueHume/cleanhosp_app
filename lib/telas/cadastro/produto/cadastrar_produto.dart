
import 'package:cleanhosp/data/model/produto.dart';
import 'package:cleanhosp/data/repositorio/produto_repositorio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddProduto extends StatefulWidget {

  static final String route = '/addProduto';
  const AddProduto({super.key});

  @override
  State<AddProduto> createState() => _AddProdutoState();
}

class _AddProdutoState extends State<AddProduto> {

  final _formKey = GlobalKey<FormBuilderState>();
  ProdutoRepositorio produtoRepositorio = ProdutoRepositorio();

  void addProduto() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final produto = Produto(
        produto_id: 0,
        ds_nome: data['ds_nome'],
        ds_marca: data['ds_marca'],
        vl_unitario: data['vl_unitario'],
        qtde_estoque: data['qtde_estoque'],
        ds_descricao: data['ds_descricao'],
      );

      await produtoRepositorio.addProduto(produto: produto);
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Produto"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: addProduto,
        child: const Text('Cadastrar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'ds_nome',
                decoration: const InputDecoration(labelText: 'Nome: '),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required()
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              //Add o resto
            ],
          ),
        ),
      ),
    );
  }
}
