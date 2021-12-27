import 'package:counter_elementary/ui/app/app.dart';
import 'package:counter_elementary/ui/app/app_dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const AppDependencies(
      app: App(),
    ),
  );
}
