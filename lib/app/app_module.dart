import 'package:adopt_pet/app/modules/login/login_module.dart';
import 'package:adopt_pet/app/modules/perfil/perfil_module.dart';
import 'package:adopt_pet/app/modules/splash/splash_module.dart';
import 'package:adopt_pet/app/shared/auth/auth_controller.dart';
import 'package:adopt_pet/app/shared/components/custom_app_bar/custom_app_bar_store.dart';
import 'package:adopt_pet/app/shared/service/auth/auth_repository.dart';
import 'package:adopt_pet/app/shared/utils/routes/routes_name.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => AuthController()),
    Bind.lazySingleton((i) => CustomAppBarStore()),
    Bind.lazySingleton((i) => ConstStyle()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(RoutesName().splashPage,
        module: SplashModule(), transition: TransitionType.fadeIn),
    ModuleRoute(RoutesName().homePage,
        module: HomeModule(), transition: TransitionType.fadeIn),
    ModuleRoute(RoutesName().loginPage,
        module: LoginModule(), transition: TransitionType.fadeIn),
    ModuleRoute(RoutesName().perfilPage,
        module: PerfilModule(), transition: TransitionType.fadeIn),
  ];
}
