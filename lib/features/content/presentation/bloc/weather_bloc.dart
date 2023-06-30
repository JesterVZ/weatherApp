import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/content/data/entities/weather/weather_data.dart';
import 'package:weather_app/features/content/domain/usecase/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase useCase;
  WeatherBloc({required this.useCase}) : super(const WeatherState.initial()) {
    on<GetWeather>((event, emit) async {
      emit(const WeatherState.loading());
      final result = await useCase.call(event.position);
      result.fold((failure) {
        emit(WeatherState.error(failure));
      }, (result){
        emit(WeatherState.getWeather(result));
      });
    });
  }
}
