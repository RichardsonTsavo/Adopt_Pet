import 'package:adopt_pet/app/shared/auth/auth_controller.dart';
import 'package:adopt_pet/app/shared/models/user/user_model.dart';
import 'package:adopt_pet/app/shared/utils/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'perfil_store.g.dart';

class PerfilStore = _PerfilStoreBase with _$PerfilStore;

abstract class _PerfilStoreBase with Store {
  final AuthController _authController = Modular.get();

  UserModel returnUserModel() {
    return _authController.userDocument!;
  }

  Widget admInfo(BoxConstraints constraints) {
    if (_authController.userDocument!.userTipe == "adm") {
      List<Map<String, dynamic>> database = getAllUsers()["users"];
      return Column(
        children: [
          Text(
            "Usuários cadastrados",
            style: TextStyle(fontSize: constraints.maxWidth * 0.05),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: database.length,
                  itemBuilder: (context, index) {
                    UserModel user = UserModel.fromMap(database[index]);
                    return ListTile(
                      title: Text(
                        "${user.userName!} | usuário: ${user.userTipe}",
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                      subtitle: Text(
                        user.userEmail!,
                        style: TextStyle(fontSize: constraints.maxWidth * 0.04),
                      ),
                    );
                  }))
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
