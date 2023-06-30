import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/failure.dart';

abstract interface class GetWeatherRepository{
  Future<Either<Failure, dynamic>> getWeather(Position position);
}
