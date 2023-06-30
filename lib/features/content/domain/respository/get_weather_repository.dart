import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/content/data/entities/weather/weather_data.dart';

abstract interface class GetWeatherRepository{
  Future<Either<Failure, WeatherData>> getWeather(Position position);
}
