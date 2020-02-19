import 'package:meta/meta.dart';

@immutable
abstract class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterLoading extends CounterState {
  CounterLoading(int counter) : super(counter);

  @override
  String toString() => 'CounterLoading';
}

class CounterLoaded extends CounterState {
  final int counter;

  CounterLoaded(this.counter) : super(counter);

  @override
  String toString() => 'CounterLoaded { counter: $counter }';
}

class CounterUnLoaded extends CounterState {
  CounterUnLoaded(int counter) : super(counter);

  @override
  String toString() => 'CounterUnLoaded';
}
