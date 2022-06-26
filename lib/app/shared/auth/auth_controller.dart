import 'dart:convert';
import 'package:adopt_pet/app/shared/models/user/user_model.dart';
import 'package:adopt_pet/app/shared/service/auth/auth_repository_interface.dart';
import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository.dart';
import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository_interface.dart';
import 'package:adopt_pet/app/shared/utils/routes/routes_name.dart';
import 'package:adopt_pet/app/shared/utils/snackbar/global_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final IAuthRepository _authRepository = Modular.get();
  final ISharedPreferencesRepositoryInterface _sharedPreferencesRepository =
      SharedPreferencesRepository();
  GlobalSnackBar snackBar = const GlobalSnackBar();
  UserModel? userDocument;

  @action
  Future loginWithLocalData() async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      List<String>? dataCredentials =
          await _sharedPreferencesRepository.getInfo(key: "Credentials");
      if (dataCredentials != null) {
        Map<String, dynamic>? user = await _authRepository.getEmailLogin(
          email: stringToBase64.decode(dataCredentials[0]),
        );
        userDocument = UserModel.fromMap(user!);
      }
      if (dataCredentials != null) {
        Modular.to.pushReplacementNamed(RoutesName().homePage);
      } else {
        Modular.to.pushReplacementNamed(RoutesName().loginPage);
      }
    } catch (onError) {
      Modular.to.pushReplacementNamed(RoutesName().loginPage);
    }
  }

  @action
  Future loginWithEmail({required String email}) async {
    try {
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      Map<String, dynamic>? user = await _authRepository.getEmailLogin(
        email: email,
      );
      if (user != null) {
        _sharedPreferencesRepository.save(key: "Credentials", item: <String>[
          stringToBase64.encode(email),
        ]);
        userDocument = UserModel.fromMap(user);
        Modular.to.pushReplacementNamed(RoutesName().homePage);
      } else {
        snackBar.showErrorSnackbar(
            "Usuário não encontrado! Por favor verifique o e-mail informado e tente novamente.");
      }
    } catch (onError) {
      snackBar.showErrorSnackbar("Um erro indefinido aconteceu.");
    }
  }

  Future logOut() async {
    userDocument = null;
    await _authRepository.getLogout();
    Modular.to.pushNamedAndRemoveUntil(
        Modular.initialRoute, ModalRoute.withName(Modular.initialRoute));
  }
}
