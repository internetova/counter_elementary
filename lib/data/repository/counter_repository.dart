/// Имитация локального хранилища для сохранения данных
class CounterRepository {
  CounterRepository();

  static int _counterValue = 4;

  int get counter => _counterValue;

  set value(int value) => _counterValue = value;
}