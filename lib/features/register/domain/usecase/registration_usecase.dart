import 'package:dartz/dartz.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/register/domain/repository/register_repository.dart';

abstract interface class RegistrationUseCase {
  Future<Either<Failure, bool>> call(String login, String password);
}

class RegistrationUseCaseImpl implements RegistrationUseCase {
  RegistrationUseCaseImpl({required this.repository});
  final RegisterRepository repository;

  @override
  Future<Either<Failure, bool>> call(String login, String password) async =>
      await repository.register(login, password);
}
