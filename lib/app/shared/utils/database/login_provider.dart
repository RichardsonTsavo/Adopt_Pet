import 'package:adopt_pet/app/shared/utils/database/database.dart';

class LoginProvider {
  Future signInWithEmail({required String email}) async {
    Map<String, dynamic> data = getAllUsers();
    Map<String, dynamic>? infoUser;

    for (var element in data["users"]) {
      if (element["userEmail"].toString().trim()
            .toLowerCase() == email.trim()
            .toLowerCase()) {
        infoUser = element;
      }
    }
    await Future.delayed(const Duration(seconds: 2));
    return infoUser;
  }
}
