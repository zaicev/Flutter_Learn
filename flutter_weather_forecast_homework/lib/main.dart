import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherForecast(),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Weather Forecast'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return Column(
    children: [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _searchCity(),
            ],
          ),
        ),
      ),
    ],
  );
}

Row _searchCity() {
  return Row(
    children: const [
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      Padding(padding: EdgeInsets.all(10.0)),
      Text(
        'Enter City Name',
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}
