import 'package:cleanhosp/constantes.dart';
import 'package:cleanhosp/telas/login/login_tela.dart';
import 'package:cleanhosp/telas/widgets/InputText.dart';
import 'package:cleanhosp/telas/widgets/LoginLabel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetSenhaTela extends StatelessWidget {

  static String route = '/resetsenha';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500, minHeight: 500),
              child: Container(
                padding: EdgeInsets.all(36),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: LoginLabel('Recuperar Senha', textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 20),
                    InputText(placeholder: 'E-mail'),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                              textStyle: TextStyle(fontSize: 16, height: 1.2),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              foregroundColor: Colors.white,
                            ),
                            child: Text('Enviar Link de Recuperação'))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText('Lembrou a Senha?'),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginTela(),
                            ));
                          },
                          child: AppText('Entrar.', cor: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
