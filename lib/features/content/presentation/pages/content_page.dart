import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/injection_container.dart';
import 'package:weather_app/core/presentation/app_colors.dart';
import 'package:weather_app/core/presentation/app_ui.dart';
import 'package:weather_app/features/content/presentation/bloc/weather_bloc.dart';

class ContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  Position? position;
  String? errorText;
  bool loading = true;

  final bloc = locator<WeatherBloc>();

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  _getCurrentPosition() async {
    await _determinePosition().then((value) {
      position = value;
      if(position != null){
        bloc.add(GetWeather(position!));
      }

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
              getWeather: (response) {},
              loading: () {
                loading = true;
              },
              error: (failure) {},
            );
            return AppUI.appScaffold(
                AppColors.white,
                Padding(
                  padding: AppUI.contentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ));
          },
        ),
      );
}
