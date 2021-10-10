import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/pages/login/login_presenter.dart';
import 'package:videoflix/app/pages/pages.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:videoflix/domain/utils/constants.dart';
// import 'package:videoflix/app/utils/constants.dart';

class LoginController extends Controller {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  String? emailTextError;
  String? passwordTextError;
  bool isLoading = false;
  LoginPresenter _loginPresenter;

  LoginController(authRepo) : _loginPresenter = LoginPresenter(authRepo) {
    initListeners();
  }

  /// Initializes [Presenter] listeners
  void initListeners() {
    _loginPresenter.loginOnComplete = this._loginOnComplete;
    _loginPresenter.loginOnError = this._loginOnError;
  }

  /// Login is successful
  void _loginOnComplete() {
    dismissLoading();
    // HHHConstants.drawer = HhDrawer(); // refresh
    Navigator.of(getContext()).pushReplacementNamed(Pages.home);
    print('Login com sucesso!');
  }

  void _loginOnError(List<LoginValidationError> e) {
    emailTextError = null;
    passwordTextError = null;
    for (LoginValidationError error in e) {
      if (error == LoginValidationError.emailRequired) {
        emailTextError = Strings.emailObrigatorio;
      } else if (error == LoginValidationError.passwordRequired) {
        passwordTextError = Strings.senhaObrigatoria;
      } else if (error == LoginValidationError.invalidEmail) {
        emailTextError = Strings.emailInvalido;
      } else if (error == LoginValidationError.loginFailed) {
        emailTextError = Strings.loginFalhou;
        passwordTextError = Strings.loginFalhou;
      }
    }
    dismissLoading();
    // showGenericSnackbar(getStateKey(), e.message, isError: true);
  }

  /// Logs a [User] into the application
  void login() async {
    isLoading = true;
    refreshUI();
    _loginPresenter.login(
        email: emailTextController.text, password: passwordTextController.text);
  }

  void dismissLoading() {
    isLoading = false;
    refreshUI();
  }

  void register() {
    Navigator.of(getContext()).pushNamed('/register');
  }

  void forgotPassword() {
    Navigator.of(getContext()).pushNamed('/forgotPw');
  }
}
