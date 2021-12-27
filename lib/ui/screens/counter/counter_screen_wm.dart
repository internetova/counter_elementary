import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_screen_model.dart';
import 'counter_screen_widget.dart';

abstract class ICounterScreenWidgetModel extends IWidgetModel {
  ListenableState<int> get counterState;

  TextStyle get counterStyle;

  void increment();

  void decrement();
}

CounterScreenWidgetModel defaultCounterScreenWidgetModelFactory(BuildContext context) {
  final model = context.read<CounterScreenModel>();
  return CounterScreenWidgetModel(model);
}

/// Default widget model for CounterScreenWidget
class CounterScreenWidgetModel extends WidgetModel<CounterScreenWidget, CounterScreenModel>
    implements ICounterScreenWidgetModel {
  CounterScreenWidgetModel(CounterScreenModel model) : super(model);

  late StateNotifier<int> _counterState;
  late TextStyle _counterStyle;

  @override
  ListenableState<int> get counterState => _counterState;

  @override
  TextStyle get counterStyle => _counterStyle;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _counterState = StateNotifier<int>(initValue: model.initCounter);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _counterStyle = Theme.of(context).textTheme.headline1?.copyWith(color: Colors.deepPurple) ??
        const TextStyle();
  }

  /// обрабатываем нажатие Увеличить
  @override
  void increment() {
    final newValue = model.increment();
    _counterState.accept(newValue);
  }

  /// обрабатываем нажатие Уменьшить
  @override
  void decrement() {
    final newValue = model.decrement();
    _counterState.accept(newValue);
  }

  @override
  void dispose() {
    _counterState.dispose();

    super.dispose();
  }
}
