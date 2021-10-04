import 'dart:async';
import 'package:videoflix/data/exceptions/authentication_exception.dart';
import 'package:videoflix/domain/repositories/authentication_repository.dart';
import 'package:videoflix/data/utils/constants.dart';
import 'package:videoflix/domain/entities/user.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videoflix/data/utils/http_helper.dart';
import 'package:logging/logging.dart';

/// `DataAuthenticationRepository` is the implementation of `AuthenticationRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataAuthenticationRepository implements AuthenticationRepository {
  // Members
  /// Singleton object of `DataAuthenticationRepository`
  static DataAuthenticationRepository _instance =
      DataAuthenticationRepository._internal();
  Logger _logger = Logger('DataAuthenticationRepository');

  // Constructors
  DataAuthenticationRepository._internal();

  factory DataAuthenticationRepository() => _instance;

  // AuthenticationRepository Methods

  /// Registers a `User` using a [email] and a [password] by making an API call to the server.
  /// It is asynchronous and can throw an `APIException` if the statusCode is not 200.
  // Future<void> register(
  //     {required String firstName,
  //     required String lastName,
  //     required String email,
  //     required String password}) async {
  //   try {
  //     await HttpHelper.invokeHttp(Constants.usersRoute, RequestType.post,
  //         body: {
  //           'firstName': firstName,
  //           'lastName': lastName,
  //           'email': email,
  //           'password': password
  //         });

  //     _logger.finest('Registration is successful');
  //   } catch (error) {
  //     _logger.warning('Could not register new user.', error);
  //     rethrow;
  //   }
  // }

  /// Logs in a `User` using a [email] and a [password] by making an API call to the server.
  /// It is asynchronous and can throw an `APIException` if the statusCode is not 200.
  /// When successful, it attempts to save the credentials of the `User` to local storage by
  /// calling [_saveCredentials]. Throws an `Exception` if an Internet connection cannot be
  /// established. Throws a `ClientException` if the http object fails.
  Future<void> authenticate(
      {required String email, required String password}) async {
    try {
      // invoke http request to login and convert body to map
      Map<String, dynamic> body = await HttpHelper.invokeHttp(
        Constants.loginRoute,
        RequestType.post,
        body: {'email': email, 'password': password},
      );
      _logger.finest('Login Successful.');

      // convert json to User and save credentials in local storage
      User user = User.fromJson(body['user']);
      _saveCredentials(token: body['token'], user: user);
    } on APIException catch (error) {
      _logger.warning(error.message);
      rethrow;
    }
  }

  /// Returns whether the current `User` is authenticated.
  Future<bool> isAuthenticated() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool? isAuthenticated = preferences.getBool(Constants.isAuthenticatedKey);
      return isAuthenticated ?? false;
    } catch (error) {
      return false;
    }
  }

  // Future<void> forgotPassword(String email) async {
  //   Uri uri = Uri.http(Constants.baseUrlNoPrefix, Constants.forgotPasswordPath,
  //       {'email': email});

  //   try {
  //     await HttpHelper.invokeHttp(uri, RequestType.get);
  //   } catch (error) {
  //     _logger.warning('Could not send reset password request.', error);
  //     rethrow;
  //   }
  // }

  /// Logs the current `User` out by clearing credentials.
  Future<void> logout() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.remove(Constants.isAuthenticatedKey);
      preferences.remove(Constants.tokenKey);
      _logger.finest('Logout successful.');
    } catch (error) {
      _logger.warning('Could not log out.', error);
    }
  }

  /// Returns the current authenticated `User` from `SharedPreferences`.
  Future<User> getCurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    User user =
        User.fromJson(jsonDecode(preferences.getString(Constants.userKey)!));
    return user;
  }

  /// Saves the [token] and the [user] in `SharedPreferences`.
  void _saveCredentials({required String token, required User user}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await Future.wait([
        preferences.setString(Constants.tokenKey, token),
        preferences.setBool(Constants.isAuthenticatedKey, true),
        preferences.setString(Constants.userKey, jsonEncode(user))
      ]);
      _logger.finest('Credentials successfully stored.');
    } catch (error) {
      _logger.warning('Credentials could not be stored.');
    }
  }
}
