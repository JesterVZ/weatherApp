abstract interface class RegistrationUseCase{
  Future call(String login, String password);
}

class RegistrationUseCaseImpl implements RegistrationUseCase{
  @override
  Future call(String login, String password) {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}