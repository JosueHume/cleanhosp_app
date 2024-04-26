import 'package:cleanhosp/constantes.dart';
import 'package:cleanhosp/telas/login/login_tela.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: double.infinity,
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.darkBg,
            ),
            child: Column(
              children: [
                SizedBox(height: 15),
                SvgPicture.asset('../lib/assets/icons/vassoura.svg',
                width: 30,
                ),
                AppText('Limpezas'),
                SizedBox(height: 28),
                SvgPicture.asset('../lib/assets/icons/adicionar.svg',
                  width: 30,
                ),
                AppText('Limpeza'),
                SizedBox(height: 28),
                SvgPicture.asset('../lib/assets/icons/ala.svg',
                  width: 30,
                ),
                AppText('Ala'),
                SizedBox(height: 28),
                SvgPicture.asset('../lib/assets/icons/local.svg',
                  width: 30,
                ),
                AppText('Local'),
                SizedBox(height: 28),
                SvgPicture.asset('../lib/assets/icons/localLimpeza.svg',
                  width: 30,
                ),
                AppText('Local de Limpeza'),
                SizedBox(height: 28),
                SvgPicture.asset('../lib/assets/icons/produto.svg',
                  width: 30,
                ),
                AppText('Produto'),
                SizedBox(height: 28),
                SvgPicture.asset('../lib/assets/icons/Equipamento.svg',
                  width: 30,
                ),
                AppText('Equipamento'),
                Spacer(),
                SvgPicture.asset('../lib/assets/icons/logout.svg',
                  width: 30,
                ),
                AppText('Sair'),
              ],
            )
        ),
        Expanded(
            child: Center(
              child: Text(''),
            ))
      ],
    );
  }
}
