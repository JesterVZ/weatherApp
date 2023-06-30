// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_from_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherDataFromList _$WeatherDataFromListFromJson(Map<String, dynamic> json) {
  return _WeatherDataFromList.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataFromList {
  int get dt => throw _privateConstructorUsedError;
  Main get main => throw _privateConstructorUsedError;
  List<Weather> get weather => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataFromListCopyWith<WeatherDataFromList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataFromListCopyWith<$Res> {
  factory $WeatherDataFromListCopyWith(
          WeatherDataFromList value, $Res Function(WeatherDataFromList) then) =
      _$WeatherDataFromListCopyWithImpl<$Res, WeatherDataFromList>;
  @useResult
  $Res call({int dt, Main main, List<Weather> weather});

  $MainCopyWith<$Res> get main;
}

/// @nodoc
class _$WeatherDataFromListCopyWithImpl<$Res, $Val extends WeatherDataFromList>
    implements $WeatherDataFromListCopyWith<$Res> {
  _$WeatherDataFromListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
  }) {
    return _then(_value.copyWith(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainCopyWith<$Res> get main {
    return $MainCopyWith<$Res>(_value.main, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherDataFromListCopyWith<$Res>
    implements $WeatherDataFromListCopyWith<$Res> {
  factory _$$_WeatherDataFromListCopyWith(_$_WeatherDataFromList value,
          $Res Function(_$_WeatherDataFromList) then) =
      __$$_WeatherDataFromListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int dt, Main main, List<Weather> weather});

  @override
  $MainCopyWith<$Res> get main;
}

/// @nodoc
class __$$_WeatherDataFromListCopyWithImpl<$Res>
    extends _$WeatherDataFromListCopyWithImpl<$Res, _$_WeatherDataFromList>
    implements _$$_WeatherDataFromListCopyWith<$Res> {
  __$$_WeatherDataFromListCopyWithImpl(_$_WeatherDataFromList _value,
      $Res Function(_$_WeatherDataFromList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dt = null,
    Object? main = null,
    Object? weather = null,
  }) {
    return _then(_$_WeatherDataFromList(
      dt: null == dt
          ? _value.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as Main,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherDataFromList implements _WeatherDataFromList {
  const _$_WeatherDataFromList(
      {required this.dt,
      required this.main,
      required final List<Weather> weather})
      : _weather = weather;

  factory _$_WeatherDataFromList.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherDataFromListFromJson(json);

  @override
  final int dt;
  @override
  final Main main;
  final List<Weather> _weather;
  @override
  List<Weather> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  String toString() {
    return 'WeatherDataFromList(dt: $dt, main: $main, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDataFromList &&
            (identical(other.dt, dt) || other.dt == dt) &&
            (identical(other.main, main) || other.main == main) &&
            const DeepCollectionEquality().equals(other._weather, _weather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dt, main, const DeepCollectionEquality().hash(_weather));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDataFromListCopyWith<_$_WeatherDataFromList> get copyWith =>
      __$$_WeatherDataFromListCopyWithImpl<_$_WeatherDataFromList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherDataFromListToJson(
      this,
    );
  }
}

abstract class _WeatherDataFromList implements WeatherDataFromList {
  const factory _WeatherDataFromList(
      {required final int dt,
      required final Main main,
      required final List<Weather> weather}) = _$_WeatherDataFromList;

  factory _WeatherDataFromList.fromJson(Map<String, dynamic> json) =
      _$_WeatherDataFromList.fromJson;

  @override
  int get dt;
  @override
  Main get main;
  @override
  List<Weather> get weather;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDataFromListCopyWith<_$_WeatherDataFromList> get copyWith =>
      throw _privateConstructorUsedError;
}
