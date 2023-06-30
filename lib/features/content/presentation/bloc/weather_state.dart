part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.getWeather(dynamic response) = _GetWeather;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.error(Failure failure) = _Error;
}
