import 'package:cleanhosp/telas/cadastro/cadastrarAla.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarEquipamento.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarLimpeza.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarLocal.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarLocalLimpeza.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarPessoa.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarProduto.dart';
import 'package:cleanhosp/telas/home/home_screen.dart';
import 'package:cleanhosp/telas/login/login_registro.dart';
import 'package:cleanhosp/telas/login/login_tela.dart';
import 'package:cleanhosp/telas/login/reset_senha.dart';

var routes = {
   HomeScreen.route: (context) => HomeScreen(),
   LoginTela.route: (context) => LoginTela(),
   LoginRegistro.route: (context) => LoginRegistro(),
   ResetSenhaTela.route: (context) => ResetSenhaTela(),
   CadastrarLimpeza.route: (context) => CadastrarLimpeza(),
   CadastrarAla.route: (context) => CadastrarAla(),
   CadastrarLocal.route: (context) => CadastrarLocal(),
   CadastrarLocalLimpeza.route: (context) => CadastrarLocalLimpeza(),
   CadastrarPessoa.route: (context) => CadastrarPessoa(),
   CadastrarEquipamento.route: (context) => CadastrarEquipamento(),
   CadastrarProduto.route: (context) => CadastrarProduto()
};