import 'package:dartz/dartz.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';

abstract interface class AuthUseCase{
  Future<Either<Failure, bool>> call(String login, String password);
}

class AuthUseCaseImpl implements AuthUseCase{
  final AuthRepository repository;
  AuthUseCaseImpl({required this.repository});
  @override
  Future<Either<Failure, bool>> call(String login, String password) async => await repository.auth(login, password);

}