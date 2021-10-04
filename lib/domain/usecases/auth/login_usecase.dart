import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:videoflix/app/utils/constants.dart';
import 'package:videoflix/domain/entities/user.dart';
import 'package:videoflix/domain/repositories/authentication_repository.dart';
import 'package:logging/logging.dart';

/// A `UseCase` for logging in a `User` into the application
class LoginUseCase extends CompletableUseCase<LoginUseCaseParams> {
  // Members
  AuthenticationRepository _authenticationRepository;
  Logger _logger = Logger('LoginUseCase');
  // Constructors
  LoginUseCase(this._authenticationRepository) : super();

  @override
  Future<Stream<User>> buildUseCaseStream(LoginUseCaseParams? params) async {
    final StreamController<User> controller = StreamController();
    if (params!._email.length <= 0) {
      controller.addError(ValidationError.emailRequired);
    } else if (params._password.length <= 0) {
      controller.addError(ValidationError.passwordRequired);
    } else {
      try {
        await _authenticationRepository.authenticate(
            email: params._email, password: params._password);
        controller.close();
      } catch (e) {
        _logger.shout('Could not login the user.', e);
        controller.addError(e);
      }
    }
    return controller.stream;
  }
}

/// The parameters required for the [LoginUseCase]
class LoginUseCaseParams {
  String _email;
  String _password;

  LoginUseCaseParams(this._email, this._password);
}

enum ValidationError { emailRequired, passwordRequired }
