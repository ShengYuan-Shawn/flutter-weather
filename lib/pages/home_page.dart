import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    _controller.addListener(() {
      setState((() => _isCityNameEmpty = _controller
          .text.isEmpty)); // arrow idicate inline function (for compact method)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search City'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please enter city name:',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 14, right: 24, bottom: 20, left: 24),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'City Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _isCityNameEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherDetail(
                            cityName: _controller.text,
                          ),
                        ),
                      );
                    },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
