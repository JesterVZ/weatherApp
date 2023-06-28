import 'package:get_it/get_it.dart';
import 'package:weather_app/features/register/data/repository/register_repository.dart';
import 'package:weather_app/features/register/domain/repository/register_repository.dart';
import 'package:weather_app/features/register/domain/usecase/registration_usecase.dart';

final locator = GetIt.instance;
Future<void> startup() async {
  locator.registerLazySingleton<RegistrationUseCase>(() => RegistrationUseCaseImpl());
  locator.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl());
}