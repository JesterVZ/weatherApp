abstract interface class AuthRepository{
  Future auth(String login, String password);
}
