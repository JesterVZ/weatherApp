import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/utils/failure.dart';
import 'package:weather_app/features/auth/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase useCase;
  AuthBloc({required this.useCase}) : super(const AuthState.initial()) {
    on<Login>((event, emit) async {
      emit(const AuthState.loading());
      final result = await useCase.call(event.login, event.password);
      result.fold((failure) {
        emit(AuthState.error(failure));
      }, (result) {
        emit(const AuthState.login());
      });
    });
  }
}
