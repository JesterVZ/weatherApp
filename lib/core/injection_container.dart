import 'package:get_it/get_it.dart';
import 'package:weather_app/core/services/firebase_service.dart';
import 'package:weather_app/core/services/shared_preferences_service.dart';
import 'package:weather_app/features/auth/data/repository/auth_repository.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repository.dart';
import 'package:weather_app/features/auth/domain/usecase/auth_usecase.dart';
import 'package:weather_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/features/content/data/repository/get_weather_repository.dart';
import 'package:weather_app/features/content/domain/respository/get_weather_repository.dart';
import 'package:weather_app/features/content/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/features/content/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/register/data/repository/register_repository.dart';
import 'package:weather_app/features/register/domain/repository/register_repository.dart';
import 'package:weather_app/features/register/domain/usecase/registration_usecase.dart';
import 'package:weather_app/features/register/presentation/bloc/registration_bloc.dart';

final locator = GetIt.instance;
Future<void> startup() async {
  locator.registerFactory(() => RegistrationBloc(useCase: locator()));
  locator.registerFactory(() => AuthBloc(useCase: locator()));
  locator.registerFactory(() => WeatherBloc(useCase: locator()));
  locator.registerLazySingleton<RegistrationUseCase>(() => RegistrationUseCaseImpl(repository: locator()));
  locator.registerLazySingleton<AuthUseCase>(() => AuthUseCaseImpl(repository: locator()));
  locator.registerLazySingleton<GetWeatherUseCase>(() => GetWeatherUseCaseImpl(repository: locator()));
  locator.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(authService: locator()));
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authService: locator()));
  locator.registerLazySingleton<GetWeatherRepository>(() => GetWeatherRepositoryImpl());
  locator.registerFactory(() => FirebaseService());
  locator.registerFactory(() => SharedPreferencesService());
}