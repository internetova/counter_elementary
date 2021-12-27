import 'package:counter_elementary/ui/res/app_strings.dart';
import 'package:counter_elementary/ui/widgets/round_button.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'counter_screen_wm.dart';

/// Экран CounterScreen
class CounterScreenWidget extends ElementaryWidget<ICounterScreenWidgetModel> {
  const CounterScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultCounterScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICounterScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.counterAppBarTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _BuildResult(
            counterState: wm.counterState,
            counterStyle: wm.counterStyle,
          ),
          const SizedBox(height: 80),
          _BuildButtons(
            increment: wm.increment,
            decrement: wm.decrement,
          ),
        ],
      ),
    );
  }
}

/// результат кликов по кнопкам
class _BuildResult extends StatelessWidget {
  final ListenableState<int> counterState;
  final TextStyle counterStyle;

  const _BuildResult({
    required this.counterState,
    required this.counterStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<int>(
        listenableState: counterState,
        builder: (_, data) {
          return Text(
            data.toString(),
            style: counterStyle,
            textAlign: TextAlign.center,
          );
        });
  }
}

/// кнопки увеличить уменьшить
class _BuildButtons extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;

  const _BuildButtons({
    required this.increment,
    required this.decrement,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundButton(
              size: 30,
              icon: Icons.add,
              onPressed: increment,
            ),
            const SizedBox(width: 20),
            RoundButton(
              size: 30,
              icon: Icons.remove,
              onPressed: decrement,
            ),
          ],
        );
  }
}
