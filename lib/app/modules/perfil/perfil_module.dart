import 'package:adopt_pet/app/modules/perfil/perfil_Page.dart';
import 'package:adopt_pet/app/modules/perfil/perfil_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PerfilModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PerfilStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PerfilPage()),
  ];
}
