import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent {
  final int counter;

  CounterEvent(this.counter);
}

class CounterLoad extends CounterEvent {
  CounterLoad(int counter) : super(counter);

  @override
  String toString() {
    return 'CounterLoad';
  }
}

class CounterIncrease extends CounterEvent {
  final int counter;

  CounterIncrease(this.counter) : super(counter);

  @override
  String toString() => 'CounterIncrease { counter: $counter }';
}

class CounterDecrease extends CounterEvent {
  final int counter;

  CounterDecrease(this.counter) : super(counter);

  @override
  String toString() => 'CounterDecrease { counter: $counter }';
}

