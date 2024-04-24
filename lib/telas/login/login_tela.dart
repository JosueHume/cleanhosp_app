import 'package:flutter/material.dart';
import '../widgets/InputText.dart';
import '../widgets/LoginLabel.dart';

class LoginTela extends StatelessWidget {
  const LoginTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161E2E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500, minHeight: 500),
              child: Container(
                width: double.infinity,
                height: 410,
                padding: EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    LoginLabel('Login'),
                    SizedBox(height: 20),
                    InputText(placeholder: 'Usuário'),
                    SizedBox(height: 20),
                    InputText(placeholder: 'Senha'),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: AppText('Esqueceu a sua senha?',
                          textAlign: TextAlign.end,
                          cor: Colors.white.withOpacity(0.5)),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: TextButton(
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText('Não tem uma Conta?'),
                        SizedBox(width: 6),
                        AppText('Criar conta.', cor: Colors.blue),
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
