import 'package:adopt_pet/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AuthController _authController = Modular.get();

  @observable
  bool isLoading = false;

  Map<String, dynamic> filds = {};

  @action
  Future signIn() async {
    isLoading = true;
    await _authController.loginWithEmail(email: filds["email"]);
    isLoading = false;
  }
}
