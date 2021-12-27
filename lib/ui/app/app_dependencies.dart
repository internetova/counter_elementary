import 'package:counter_elementary/data/repository/counter_repository.dart';
import 'package:counter_elementary/ui/app/app.dart';
import 'package:counter_elementary/ui/common/error_handlers/default_error_handler.dart';
import 'package:counter_elementary/ui/screens/counter/counter_screen_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget with dependencies that live all runtime.
class AppDependencies extends StatefulWidget {
  final App app;

  const AppDependencies({required this.app, Key? key}) : super(key: key);

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  late final DefaultErrorHandler _defaultErrorHandler;
  late final CounterRepository _counterRepository;
  late final CounterScreenModel _counterScreenModel;

  late final ThemeWrapper _themeWrapper;

  @override
  void initState() {
    super.initState();

    _defaultErrorHandler = DefaultErrorHandler();
    _counterRepository = CounterRepository();

    _counterScreenModel = CounterScreenModel(
      _counterRepository,
      _defaultErrorHandler,
    );

    _themeWrapper = ThemeWrapper();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CounterScreenModel>(
          create: (_) => _counterScreenModel,
        ),
        Provider<ThemeWrapper>(
          create: (_) => _themeWrapper,
        ),
      ],
      child: widget.app,
    );
  }
}
