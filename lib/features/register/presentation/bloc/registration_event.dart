part of 'registration_bloc.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.started() = Started;
  const factory RegistrationEvent.register(String login, String password) = Register;
}
