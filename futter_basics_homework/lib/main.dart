import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    const TextStyle myTextStyle = TextStyle(
      color: Color.fromRGBO(187, 222, 251, 1),
      fontWeight: FontWeight.bold,
    );
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade300,
        appBar: AppBar(
          title: const Text("Counter"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap "-" to decrement',
              style: myTextStyle,
            ),
            const Padding(padding: EdgeInsets.all(3.0)),
            CounterWidget(),
            const Padding(padding: EdgeInsets.all(3.0)),
            const Text(
              'Tap "+" to increment',
              style: myTextStyle,
            ),
          ],
        )),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _count = 50;
  void _incrementalCounter(String singCount) {
    setState(() {
      singCount == "+" ? _count++ : _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.blue.shade100,
        child: SizedBox(
          width: 117,
          height: 40,
          child: Center(
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => _incrementalCounter('-'),
                  icon: const Icon(Icons.remove),
                  iconSize: 18,
                ),
                Text(
                  '$_count',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () => _incrementalCounter('+'),
                  icon: const Icon(Icons.add),
                  iconSize: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
