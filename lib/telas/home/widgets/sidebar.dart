import 'package:cleanhosp/telas/cadastro/cadastrarAla.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarLimpeza.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarLocal.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarLocalLimpeza.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarProduto.dart';
import 'package:cleanhosp/telas/cadastro/cadastrarEquipamento.dart';
import 'package:cleanhosp/telas/login/login_tela.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 120,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xff161E2E), // Defina a cor de fundo conforme necessário
      ),
      child: Column(
        children: [
          SizedBox(height: 15),
          SvgPicture.asset(
            '../lib/assets/icons/vassoura.svg',
            width: 30,
          ),
          AppText('Limpezas'),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CadastrarLimpeza.route);
            },
            child: Column(
              children: [
                SizedBox(height: 28),
                SvgPicture.asset(
                  '../lib/assets/icons/adicionar.svg',
                  width: 30,
                ),
                AppText('Limpeza'),
              ],
            ),
          ),
          SizedBox(height: 28),
          SvgPicture.asset(
            '../lib/assets/icons/ala.svg',
            width: 30,
          ),
          AppText('Ala'),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CadastrarAla.route);
            },
            child: SizedBox(height: 28),
          ),
          SvgPicture.asset(
            '../lib/assets/icons/local.svg',
            width: 30,
          ),
          AppText('Local'),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CadastrarLocal.route);
            },
            child: SizedBox(height: 28),
          ),
          SvgPicture.asset(
            '../lib/assets/icons/localLimpeza.svg',
            width: 30,
          ),
          AppText('Local de Limpeza'),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CadastrarLocalLimpeza.route);
            },
            child: SizedBox(height: 28),
          ),
          SvgPicture.asset(
            '../lib/assets/icons/produto.svg',
            width: 30,
          ),
          AppText('Produto'),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CadastrarProduto.route);
            },
            child: SizedBox(height: 28),
          ),
          SvgPicture.asset(
            '../lib/assets/icons/Equipamento.svg',
            width: 30,
          ),
          AppText('Equipamento'),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CadastrarEquipamento.route);
            },
            child: SizedBox(height: 28),
          ),
          Spacer(),
          SvgPicture.asset(
            '../lib/assets/icons/logout.svg',
            width: 30,
          ),
          AppText('Sair'),
        ],
      ),
    );
  }
}
