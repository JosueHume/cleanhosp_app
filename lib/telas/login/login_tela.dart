import 'package:cleanhosp/constantes.dart';
import 'package:cleanhosp/telas/login/login_registro.dart';
import 'package:cleanhosp/telas/login/reset_senha.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/InputText.dart';
import '../widgets/LoginLabel.dart';

class LoginTela extends StatelessWidget {
  static String route = '/login';

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
                padding: EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: LoginLabel('Login', textAlign: TextAlign.center,),
                    ),
                    SizedBox(height: 20),
                    InputText(placeholder: 'Usuário'),
                    InputText(placeholder: 'Senha'),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ResetSenhaTela.route);
                      },
                      child: AppText('Esqueceu a sua senha?',
                          textAlign: TextAlign.end,
                          cor: Theme.of(context).primaryColor
                      ),
                    ),
                    ),
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
                            child: Text('Entrar'))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText('Não tem uma Conta?'),
                        SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, LoginRegistro.route);
                          },
                          child: AppText('Criar conta.', cor: Colors.blue),
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

class AppText extends StatelessWidget {
  final String texto;
  final TextAlign? textAlign;
  final Color? cor;

  AppText(this.texto, {this.textAlign, this.cor});

  @override
  Widget build(BuildContext context) {
    return Text(texto,
        textAlign: textAlign, style: TextStyle(color: cor ?? Colors.white));
  }
}
