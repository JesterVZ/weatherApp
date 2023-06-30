
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/features/content/data/entities/weather/main.dart';
import 'package:weather_app/features/content/data/entities/weather/weather.dart';

part 'weather_data_from_list.freezed.dart';
part 'weather_data_from_list.g.dart';

@freezed
class WeatherDataFromList with _$WeatherDataFromList{
  const factory WeatherDataFromList({required int dt, required Main main, required List<Weather> weather}) = _WeatherDataFromList;
  factory WeatherDataFromList.fromJson(Map<String, dynamic> json) => _$WeatherDataFromListFromJson(json);
}