import 'package:cleanhosp/data/model/produto.dart';
import 'package:cleanhosp/data/repositorio/produto_repositorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:http/http.dart' as http;

class EditarProduto extends StatefulWidget {

  final Produto produto;
  const EditarProduto({super.key, required this.produto});

  @override
  State<EditarProduto> createState() => _EditarProdutoState();
}

class _EditarProdutoState extends State<EditarProduto> {

  final _formKey = GlobalKey<FormBuilderState>();
  ProdutoRepositorio produtoRepositorio = ProdutoRepositorio();
  late http.Response response;

  void updateProduto() async {
    if(_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final produto = Produto(
        produto_id: widget.produto.produto_id,
        ds_nome: data['ds_nome'],
        ds_marca: data['ds_marca'],
        ds_descricao: data['ds_descricao'],
        qtde_estoque: data['qtde_estoque'],
        vl_unitario: data['vl_unitario'],
      );

      response = await produtoRepositorio.updateProduto(
          produto: produto,
          id: widget.produto.produto_id
      );
    }

    if(!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Produto"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: updateProduto,
        child: const Text('Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          initialValue: {
            'ds_nome' : widget.produto.ds_nome,
          },
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'ds_descricao',
                decoration: const InputDecoration(labelText: 'Descrição: '),
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
