import 'package:adopt_pet/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx/mobx.dart';

part 'custom_app_bar_store.g.dart';

class CustomAppBarStore = _CustomAppBarStoreBase with _$CustomAppBarStore;

abstract class _CustomAppBarStoreBase with Store {
  final AuthController _authController = Modular.get();

  bool isHome() {
    return Modular.to.path.contains("home") ? true : false;
  }

  void logOut() {
    _authController.logOut();
  }
}
