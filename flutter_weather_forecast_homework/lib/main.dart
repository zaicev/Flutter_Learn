import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        elevation: 0,
        backgroundColor: Colors.red,
        title: const Text('Weather Forecast'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  const double spacer = 20.0;
  return Column(
    children: [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _searchCity(),
              const Padding(padding: EdgeInsets.all(spacer)),
              _cityDetail(),
              const Padding(padding: EdgeInsets.all(spacer)),
              _temperatureDetail(),
              const Padding(padding: EdgeInsets.all(spacer)),
              _extraWeatherDetails(),
              const Padding(padding: EdgeInsets.all(spacer)),
              _text('7-DAY WEATHER FORECAST', 18.0),
              const Padding(padding: EdgeInsets.all(5)),
              _weeklyWeatherDetails_(),
            ],
          ),
        ),
      ),
    ],
  );
}

Row _searchCity() {
  return Row(
    children: [
      _icon(Icons.search, 26),
      const Padding(padding: EdgeInsets.all(14.0)),
      _text('Enter City Name', 16.0, FontWeight.normal),
    ],
  );
}

Row _cityDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          _text('Chisinau city, MD', 32.0),
          const Padding(padding: EdgeInsets.all(5.0)),
          _text(DateFormat('EEEE , MMM d, yyyy').format(DateTime.now()), 20.0),
        ],
      ),
    ],
  );
}

Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _icon(Icons.wb_sunny, 90.0),
        ],
      ),
      const SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              _text('34 °C', 60.0, FontWeight.w200),
            ],
          ),
          Row(
            children: [
              _text('SUNNY', 20.0),
            ],
          ),
        ],
      ),
    ],
  );
}

Row _extraWeatherDetails() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _extraWeatherDetail('5', 'km/hr'),
      _extraWeatherDetail('3', '%'),
      _extraWeatherDetail('20', '%'),
    ],
  );
}

Column _extraWeatherDetail(String temperature, String unit) {
  return Column(
    children: [
      _icon(Icons.ac_unit, 30),
      const Padding(padding: EdgeInsets.all(2.0)),
      _text(temperature, 20.0),
      const Padding(padding: EdgeInsets.all(2.0)),
      _text(unit, 12.0),
    ],
  );
}

Widget _weeklyWeatherDetails_() {
  final List<String> days = [];
  for (int i = 0; i < 7; i++) {
    final date = DateTime.now().add(Duration(days: i));
    days.add(DateFormat('EEEE').format(date));
  }

  return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (BuildContext context, int index) => Card(
          child: _weeklyWeatherDetail(days[index], index + 20),
        ),
      ));
}

Widget _weeklyWeatherDetail(String day, int index) {
  return Container(
    width: 150,
    padding: const EdgeInsets.all(8.0),
    color: Colors.red.shade200,
    child: Column(children: [
      _text(day, 24, FontWeight.w300),
      const Padding(padding: EdgeInsets.all(10.0)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(padding: EdgeInsets.all(2.0)),
        _text('$index °C', 24),
        const Padding(padding: EdgeInsets.all(5.0)),
        _icon(Icons.wb_sunny, 36)
      ]),
    ]),
  );
}

Text _text(String text, double fontSize, [FontWeight? fontWeight]) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontWeight: fontWeight ?? FontWeight.w300,
      fontSize: fontSize,
    ),
  );
}

Icon _icon(IconData icon, double size) {
  return Icon(
    icon,
    size: size,
    color: Colors.white,
  );
}
