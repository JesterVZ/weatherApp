
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData{
  const factory LoginData({required String login, required String password}) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _LoginDataFromJson(json);
}