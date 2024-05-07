import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constantes.dart';
import '../widgets/InputText.dart';
import '../widgets/LoginLabel.dart';
import 'login_tela.dart';

class LoginRegistro extends StatelessWidget {

  static String route = '/registrar';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
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
                        child: LoginLabel(
                        'Nova Conta',
                        textAlign: TextAlign.center
                        ),
                        ),
                    InputText(placeholder: 'Nome'),
                    InputText(placeholder: 'CPF'),
                    InputText(placeholder: 'Telefone'),
                    InputText(placeholder: 'E-mail'),
                    InputText(placeholder: 'Login'),
                    InputText(placeholder: 'Senha'),
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
                            child: Text('Criar Conta'))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText('Já tem uma Conta?'),
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
