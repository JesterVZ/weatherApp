
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather{
  const factory Weather({required String main, required String description}) = _Weather;
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}