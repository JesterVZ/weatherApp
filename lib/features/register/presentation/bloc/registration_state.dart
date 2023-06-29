part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = _Initial;
  const factory RegistrationState.loading() = _Loading;
  const factory RegistrationState.register() = _Register;
  const factory RegistrationState.error(Failure failure) = _Error;
}
