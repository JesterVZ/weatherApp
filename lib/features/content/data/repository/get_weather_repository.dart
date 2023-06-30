import 'package:dartz/dartz.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:weather_app/core/const/App.dart';
import 'package:weather_app/core/data/api_client.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/content/data/entities/weather/weather_data.dart';
import 'package:weather_app/features/content/domain/respository/get_weather_repository.dart';

class GetWeatherRepositoryImpl implements GetWeatherRepository {
  @override
  Future<Either<Failure, WeatherData>> getWeather(Position position) async {
    try {
      final result = await ApiClient.get( url: '/data/2.5/forecast', params: _paramsMap(position));
      return Right(WeatherData.fromJson(result.data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  _paramsMap(Position position) => {
        'lat': position.latitude,
        'lon': position.longitude,
        'lang': 'ru',
        'units': 'metric',
        'appid': App.apiKey
      };
}
