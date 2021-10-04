import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/components/inputField.dart';
import 'package:videoflix/app/pages/login/login_controller.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:videoflix/data/repositories/data_auth_repo.dart';
import 'package:websafe_svg/websafe_svg.dart';

class LoginPage extends View {
  // LoginPage({Key key, this.title}) : super(key: key);
  // LoginPage(this.title);

  // final String title;
  final LoginController controller =
      LoginController(DataAuthenticationRepository());

  @override
  LoginPageView createState() => LoginPageView(controller);
}

class LoginPageView extends ViewState<LoginPage, LoginController> {
  final FocusNode _emailFocus;
  final FocusNode _passFocus;
  final LoginController controller;
  // final LoginController _loginController = LoginController(DataAuthenticationRepository());
  String email = "";
  String senha = "";

  LoginPageView(this.controller)
      : _emailFocus = FocusNode(),
        _passFocus = FocusNode(),
        super(controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'images/loginBg.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black38,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        WebsafeSvg.asset(
                          'images/logo.svg',
                          fit: BoxFit.contain,
                          height: 35.0,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300.0,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 100.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 28.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30.0),
                                  // EnsureVisibleWhenFocused(
                                  //   child:
                                  InputField(
                                    controller.emailTextController,
                                    'Email',
                                    controller.emailTextError,
                                    _emailFocus,
                                    type: TextInputType.emailAddress,
                                  ),
                                  //   focusNode: _emailFocus,
                                  // ),
                                  SizedBox(height: 10.0),
                                  // EnsureVisibleWhenFocused(
                                  //   child:
                                  InputField(
                                    controller.passwordTextController,
                                    'Senha',
                                    controller.passwordTextError,
                                    _passFocus,
                                    isPassword: true,
                                  ),
                                  //   focusNode: _emailFocus,
                                  // ),
                                  SizedBox(height: 30.0),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.login();
                                      },
                                      child: Text("Entrar"),
                                      style: ElevatedButton.styleFrom(
                                        primary: fundoVermelhoBotao,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
