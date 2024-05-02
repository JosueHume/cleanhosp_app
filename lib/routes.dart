import 'package:cleanhosp/telas/cadastro/ala/cadastrar_ala.dart';
import 'package:cleanhosp/telas/cadastro/equipamento/cadastrar_equipamento.dart';
import 'package:cleanhosp/telas/cadastro/limpeza/cadastrar_limpeza.dart';
import 'package:cleanhosp/telas/cadastro/local/cadastrar_local.dart';
import 'package:cleanhosp/telas/cadastro/localLimpeza/cadastrar_localLimpeza.dart';
import 'package:cleanhosp/telas/cadastro/pessoa/cadastrar_pessoa.dart';
import 'package:cleanhosp/telas/cadastro/produto/cadastrar_produto.dart';
import 'package:cleanhosp/telas/home/home_screen.dart';
import 'package:cleanhosp/telas/listagem/listagemAla.dart';
import 'package:cleanhosp/telas/listagem/listagemEquipamento.dart';
import 'package:cleanhosp/telas/listagem/listagemLimpeza.dart';
import 'package:cleanhosp/telas/listagem/listagemLocal.dart';
import 'package:cleanhosp/telas/listagem/listagemLocalLimpeza.dart';
import 'package:cleanhosp/telas/listagem/listagemPessoa.dart';
import 'package:cleanhosp/telas/listagem/listagemProduto.dart';
import 'package:cleanhosp/telas/login/login_registro.dart';
import 'package:cleanhosp/telas/login/login_tela.dart';
import 'package:cleanhosp/telas/login/reset_senha.dart';

var routes = {
   HomeScreen.route: (context) => HomeScreen(),
   LoginTela.route: (context) => LoginTela(),
   LoginRegistro.route: (context) => LoginRegistro(),
   ResetSenhaTela.route: (context) => ResetSenhaTela(),
   ListagemAla.route: (context) => ListagemAla(),
   AddAla.route: (context) => AddAla(),
   ListagemEquipamento.route: (context) => ListagemEquipamento(),
   AddEquipamento.route: (context) => AddEquipamento(),
   ListagemLimpeza.route: (context) => ListagemEquipamento(),
   AddLimpeza.route: (context) => AddLimpeza(),
   ListagemLocal.route: (context) => ListagemLocal(),
   AddLocal.route: (context) => AddLocal(),
   ListagemLocalLimpeza.route: (context) => ListagemLocalLimpeza(),
   AddLocalLimpeza.route: (context) => AddLocalLimpeza(),
   ListagemPessoa.route: (context) => ListagemPessoa(),
   AddPessoa.route: (context) => AddPessoa(),
   ListagemProduto.route: (context) => ListagemProduto(),
   AddProduto.route: (context) => AddProduto(),
};