import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/injection_container.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';
import 'package:weather_app/core/presentation/widgets/indicator.dart';
import 'package:weather_app/features/content/data/entities/weather/weather_data.dart';
import 'package:weather_app/features/content/presentation/bloc/weather_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<StatefulWidget> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  Position? position;
  String? errorText;
  bool loading = true;

  late WeatherData currentWeather;

  final bloc = locator<WeatherBloc>();

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _onRefrash() async {
    bloc.add(GetWeather(position!));
  }

  _getCurrentPosition() async {
    await _determinePosition().then((value) {
      position = value;
      if (position != null) {
        bloc.add(GetWeather(position!));
      }
    }).onError((error, stackTrace) {
      setState(() {
        errorText = error.toString();
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the dev
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) => _buildScaffold();

  _buildScaffold() => BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            state.when(
              initial: () {},
              getWeather: (response) {
                loading = false;
                currentWeather = response;
              },
              loading: () {
                loading = true;
              },
              error: (failure) {
                loading = false;
                errorText = "Ошибка получения данных";
              },
            );
            return AppUI.appScaffold(
                context: context,
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.appColor, AppColors.black]),
                loading
                    ? const Center(
                        child: AppProgressIndicator(color: AppColors.white),
                      )
                    : Padding(
                        padding: AppUI.contentPadding,
                        child: RefreshIndicator(
                          onRefresh: _onRefrash,
                          child: Column(
                            children: [
                              Expanded(
                                  child: ListView(
                                children: [_buildLocation(),_buildWeatherImage(currentWeather.list[0].weather[0].main)],
                              )),
                            ],
                          ),
                        ),
                      ));
          },
        ),
      );
  _buildLocation() => Row(
        children: [
          SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('assets/location.svg')),
          Text(
            "${currentWeather.city.name}, ${currentWeather.city.country}",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.white),
          )
        ],
      );

  _weatherImage() => Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
                colors: [Color(0xFFBD87FF), Colors.transparent])),
        child: Center(child: _buildWeatherImage(currentWeather.list[0].weather[0].main)),
      );
  _buildWeatherImage(String weather) => SizedBox(width: 120, height: 120, child: switch (weather) {
        'Rain' => SvgPicture.asset('assets/rain.svg',),
        'Snow' => SvgPicture.asset('assets/snow.svg'),
        'Clouds' => SvgPicture.asset('assets/location.svg' ),
        'Extreme' => SvgPicture.asset('assets/storm.svg'),
        _ => SvgPicture.asset('assets/sun.svg')
      });
}
