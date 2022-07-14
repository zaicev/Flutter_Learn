import 'package:flutter/material.dart';
import 'package:flutter_provider_homework/ui/widgets/provider_widget.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child: const ProviderWidget(),
      ),
    );
  }
}
