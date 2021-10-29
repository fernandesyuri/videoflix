import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

const fundoCinzaTextField = Color(0xFF333333);
const fundoVermelhoBotao = Color(0xFFFD142E);

class UIConstants {
  static const String appName = "VideoFlix";
  static const Color errorTextColor = Colors.red;

  static const Color pageBackgroundColor = Color(0xFF303030);
  static const Color navbarBackgroundColor = Colors.grey;
  static const double navbarItemsDistance = 30.0;

  static const double horizontalPadding = 30.0;

  static const TextStyle fieldHintStyle =
      TextStyle(fontWeight: FontWeight.w300, color: Colors.black);
  static const double progressBarOpacity = 0.6;
  static const Color progressBarColor = Colors.black;
}

class Strings {
  static const String emailObrigatorio = 'Digite um email';
  static const String emailInvalido = 'Digite um email válido';
  static const String senhaObrigatoria = 'Digite uma senha';
  static const String loginFalhou = 'Email ou senha incorretos';

  static const String registrationFormIncomplete = 'Form must be filled out.';
  static const String tosNotAccepted =
      'Please accept the Terms of Service to register.';
  static const String registrationSuccessful = 'Registration Successful!';
  static const String forgotEmailSent =
      'Check your email for reset instructions.';
  static const String forgotPwInstructions =
      'Enter the email address associated with the forgotten account. Further instructions will be sent the account email.';
}

class Resources {
  static const String background = 'assets/img/background.jpg';
  static const String logo = 'assets/img/logo.png';
  static const String loader = 'assets/img/loading.svg';
  static const String event_race = 'assets/img/event_race.jpg';
  static const String event_spaghetti = 'assets/img/event_spaghetti.jpg';
  static const String event_consumer = 'assets/img/event_consumer.jpg';
  static const String checkpoint = 'assets/img/checkpoint_16x16.bmp';
}

// /// Returns the app's default snackbar with a [text].
// SnackBar _getGenericSnackbar(String text, bool isError) {
//   return SnackBar(
//     content: Text(
//       text,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: isError ? Colors.red : Colors.white,
//         fontSize: 16.0,
//       ),
//     ),
//   );
// }

// /// Shows a generic [Snackbar]
// void showGenericSnackbar(GlobalKey<ScaffoldState> key, String text,
//     {bool isError = false}) {
//   key.currentState.showSnackBar(_getGenericSnackbar(text, isError));
// }
