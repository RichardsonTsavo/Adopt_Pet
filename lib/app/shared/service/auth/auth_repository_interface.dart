abstract class IAuthRepository {
  Future getLogout();
  Future getEmailLogin({required String email});
}
