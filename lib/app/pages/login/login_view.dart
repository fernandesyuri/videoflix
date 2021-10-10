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
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image(
                image: AssetImage('assets/images/login_bg.jpg'),
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
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        WebsafeSvg.asset(
                          'assets/images/logo.svg',
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: MediaQuery.of(context).size.height >
                                        500
                                    ? 100.0
                                    : (MediaQuery.of(context).size.height > 350
                                        ? 30.0
                                        : 15.0),
                              ),
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
                                  SizedBox(
                                    height:
                                        (MediaQuery.of(context).size.height >
                                                350
                                            ? 30.0
                                            : 15.0),
                                  ),
                                  ControlledWidgetBuilder<LoginController>(
                                    builder: (context, controller) {
                                      // EnsureVisibleWhenFocused(
                                      //   child:
                                      return InputField(
                                        controller.emailTextController,
                                        'Email',
                                        controller.emailTextError,
                                        _emailFocus,
                                        type: TextInputType.emailAddress,
                                      );
                                      //   focusNode: _emailFocus,
                                      // ),
                                    },
                                  ),
                                  SizedBox(height: 10.0),
                                  ControlledWidgetBuilder<LoginController>(
                                    builder: (context, controller) {
                                      // EnsureVisibleWhenFocused(
                                      //   child:
                                      return InputField(
                                        controller.passwordTextController,
                                        'Senha',
                                        controller.passwordTextError,
                                        _passFocus,
                                        isPassword: true,
                                      );
                                      //   focusNode: _emailFocus,
                                      // ),
                                    },
                                  ),
                                  SizedBox(
                                    height:
                                        (MediaQuery.of(context).size.height >
                                                350
                                            ? 30.0
                                            : 15.0),
                                  ),
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
