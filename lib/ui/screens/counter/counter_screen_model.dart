import 'package:counter_elementary/data/repository/counter_repository.dart';
import 'package:elementary/elementary.dart';

/// Default Elementary model for CounterScreen module
/// Работа с данными
class CounterScreenModel extends ElementaryModel {
  final CounterRepository _counterRepository;
  var _counter = 0;

  int get initCounter => _counterRepository.counter;

  CounterScreenModel(
    this._counterRepository,
    ErrorHandler errorHandler,
  ) : super(errorHandler: errorHandler);

  /// получить текущее значение в репозиторий
  void _getCounter() {
    _counter = _counterRepository.counter;
  }

  /// записать новое значение в репозиторий
  void _setCounter(int value) {
    _counterRepository.value = value;
    _counter = value;
  }

  /// меняем значение счетчика
  int _changeCounter(int value, {required bool isIncrement}) {
    int newValue = isIncrement ? value + 1 : value - 1;
    _setCounter(newValue);
    return newValue;
  }

  int increment() {
    _getCounter();
    return _changeCounter(_counter, isIncrement: true);
  }

  /// обрабатываем нажатие Уменьшить
  int decrement() {
    _getCounter();
    if (_counter == 0) return 0;
    return _changeCounter(_counter, isIncrement: false);
  }
}
