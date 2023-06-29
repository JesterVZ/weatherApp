import 'package:dartz/dartz.dart';
import 'package:weather_app/core/services/firebase_service.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final FirebaseService authService;
  AuthRepositoryImpl({required this.authService});
  @override
  Future<Either<Failure, bool>> auth(String login, String password) async {
    try{
      await authService.signIn(email: login, password: password);
      return const Right(true);
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }

}