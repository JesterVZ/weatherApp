import 'package:dartz/dartz.dart';
import 'package:weather_app/core/services/auth_service.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository{

  RegisterRepositoryImpl({required this.authService});
  final AuthService authService;
  @override
  Future<Either<Failure, bool>> register(String login, String password) async {
    try{
      await authService.createUser(email: login, password: password);
      return const Right(true);
    } catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }
  
}