import 'package:adopt_pet/app/shared/auth/auth_controller.dart';
import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository.dart';
import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository_interface.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final AuthController _authController = Modular.get();

  Future<void> getPersistentLogin() async {
    ISharedPreferencesRepositoryInterface pref = SharedPreferencesRepository();
    ConstStyle constStyle = Modular.get();
    List<String>? data = await pref.getInfo(key: "indexBaseColor");
    if (data != null) {
      constStyle.indexBaseColor = int.parse(data[0]);
    }
    _authController.loginWithLocalData();
  }
}
