import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 340,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}@2x.png'),
            // '${weatherModel.weather.first.icon}',
            const SizedBox(height: 14),
            Text(
              '${weatherModel.weather.first.description}',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              '${weatherModel.name}',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w600,
                fontSize: 38,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Temperature: ${weatherModel.main.temp}°C',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Feels Like: ${weatherModel.main.feelsLike}°C',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Min Temp: ${weatherModel.main.tempMin}°C',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Max Temp: ${weatherModel.main.tempMax}°C',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Pressure: ${weatherModel.main.pressure} hPa',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Humidity: ${weatherModel.main.humidity}%',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
