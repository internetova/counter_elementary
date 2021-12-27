import 'package:counter_elementary/ui/res/app_strings.dart';
import 'package:counter_elementary/ui/screens/counter/counter_screen_widget.dart';
import 'package:flutter/material.dart';

/// App main widget.
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const CounterScreenWidget(),
    );
  }
}
