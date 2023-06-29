import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/register/domain/usecase/registration_usecase.dart';

part 'registration_event.dart';
part 'registration_state.dart';
part 'registration_bloc.freezed.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationUseCase useCase;
  RegistrationBloc({required this.useCase}) : super(const RegistrationState.initial()) {
    on<Register>((event, emit) async {
      emit(const RegistrationState.loading());
      final result = await useCase.call(event.login, event.password);
      result.fold((failure){
        emit(RegistrationState.error(failure));
      }, (result){
        emit(const RegistrationState.register());
      });
      emit(const RegistrationState.register());
    });
  }
}
