import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class ViewModel extends ChangeNotifier {
  bool isChanged = true;
  int duration = 20;
  void changeListener() {
    isChanged = isChanged ? false : true;
    notifyListeners();
  }
}

class ProviderWidget extends StatelessWidget {
  const ProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40), child: MyAppBar()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyBox(),
            MySwitch(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //debugPrint('MyAppBar');
    final viewModel = context.watch<ViewModel>();
    final Color myColor = UniqueColorGenerator.getColor();
    return AppBar(
      title: Text(
        'Homework Provider',
        style: TextStyle(
          color: myColor,
        ),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
      elevation: 0.0,
    );
  }
}

class MyBox extends StatelessWidget {
  const MyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //debugPrint('MyBox');
    final viewModel = context.watch<ViewModel>();
    final myColor = UniqueColorGenerator.getColor();
    return Center(
      child: AnimatedContainer(
        width: 200.0,
        height: 200.0,
        color: myColor,
        alignment: Alignment.center,
        duration: Duration(milliseconds: viewModel.duration),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}

class MySwitch extends StatelessWidget {
  const MySwitch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ViewModel>();
    bool isEnable = viewModel.isChanged;
    return Switch(
      value: isEnable,
      onChanged: (bool value) {
        viewModel.changeListener();
      },
    );
  }
}

class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
  }
}
