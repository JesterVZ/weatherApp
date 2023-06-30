
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class Main with _$Main{
  const factory Main({required double temp, required double temp_min, required double temp_max}) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}