// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_from_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherDataFromList _$$_WeatherDataFromListFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherDataFromList(
      dt: json['dt'] as int,
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WeatherDataFromListToJson(
        _$_WeatherDataFromList instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
    };
