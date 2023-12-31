import 'package:dartz/dartz.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/content/data/entities/weather/weather_data.dart';
import 'package:weather_app/features/content/domain/respository/get_weather_repository.dart';

abstract interface class GetWeatherUseCase{
  Future<Either<Failure, WeatherData>> call(Position position);
}

class GetWeatherUseCaseImpl implements GetWeatherUseCase{
  final GetWeatherRepository repository;
  GetWeatherUseCaseImpl({required this.repository});
  @override
  Future<Either<Failure, WeatherData>> call(Position position) async => await repository.getWeather(position);

}