import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/auth_service.dart';
import 'package:weather_app/features/register/data/repository/register_repository.dart';
import 'package:weather_app/features/register/domain/repository/register_repository.dart';
import 'package:weather_app/features/register/domain/usecase/registration_usecase.dart';
import 'package:weather_app/features/register/presentation/bloc/registration_bloc.dart';

final locator = GetIt.instance;
Future<void> startup() async {
  locator.registerFactory(() => RegistrationBloc(useCase: locator()));
  locator.registerLazySingleton<RegistrationUseCase>(() => RegistrationUseCaseImpl(repository: locator()));
  locator.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(authService: locator()));
  locator.registerFactory(() => AuthService());
}