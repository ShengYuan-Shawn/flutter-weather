import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/states/weather_state.dart';
import '../states/weather_cubit.dart';
import '../widgets/weather_information.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required this.cityName, Key? key}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    //
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
      ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather Detail'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
            bloc: BlocProvider.of<WeatherCubit>(context),
            builder: (context, state) {
              /* The builder uses flat if statement instead of nested if 
              because the state only return a value when the builder check the condition */
              if (state is WeatherLoading) {
                return const CircularProgressIndicator();
              }

              if (state is WeatherLoaded) {
                // Return the Weather Widget in MyApp
                return WeatherInformation(weatherModel: state.weatherModel);
              }

              return Text(state is WeatherError ? state.errorMessage : '');
            }),
      ),
    );
  }
}
