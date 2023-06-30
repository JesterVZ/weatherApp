
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/content/data/entities/weather/city.dart';
import 'package:weather_app/features/content/data/entities/weather/weather_data_from_list.dart';

part 'weather_data.freezed.dart';
part 'weather_data.g.dart';

@freezed
class WeatherData with _$WeatherData{
  const factory WeatherData({required List<WeatherDataFromList> list, required City city}) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);
}