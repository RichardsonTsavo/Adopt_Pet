import 'package:adopt_pet/app/shared/service/auth/auth_repository_interface.dart';
import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository.dart';
import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository_interface.dart';
import 'package:adopt_pet/app/shared/utils/database/login_provider.dart';

class AuthRepository implements IAuthRepository {
  final ISharedPreferencesRepositoryInterface _sharedPreferencesRepository =
      SharedPreferencesRepository();
  final loginProvider = LoginProvider();
  @override
  Future getLogout() async {
    await _sharedPreferencesRepository.deleteInfo();
  }

  //login
  @override
  Future getEmailLogin({required String email}) async {
    Map<String, dynamic>? user =
        await loginProvider.signInWithEmail(email: email);
    return user;
  }
}
