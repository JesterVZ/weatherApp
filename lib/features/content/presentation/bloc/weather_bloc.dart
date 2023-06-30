import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/content/domain/usecase/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase useCase;
  WeatherBloc({required this.useCase}) : super(const WeatherState.initial()) {
    on<GetWeather>((event, emit) {
      emit(const WeatherState.loading());
      final result = useCase.call(event.position);

    });
  }
}
