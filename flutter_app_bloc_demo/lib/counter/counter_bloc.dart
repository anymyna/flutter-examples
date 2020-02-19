import 'dart:async';
import 'package:bloc/bloc.dart';
import './counter.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterLoading(0);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if(event is CounterLoad) {
      yield* _mapCounterLoadToState();
    } else if (event is CounterIncrease) {
      yield* _mapCounterIncreaseToState(event);
    } else if (event is CounterDecrease) {
      yield* _mapCounterDecreaseToState(event);
    }
  }

  Stream<CounterState> _mapCounterLoadToState() async* {
    try {
      yield CounterLoaded(0);
    } catch (_) {
      yield CounterUnLoaded(0);
    }
  }

  Stream<CounterState> _mapCounterIncreaseToState(CounterEvent counterEvent) async* {
    if (currentState is CounterLoaded) {
      final int counter = (currentState as CounterLoaded).counter + counterEvent.counter;
      yield CounterLoaded(counter);
      _print(counter);
    }
  }

  Stream<CounterState> _mapCounterDecreaseToState(CounterEvent counterEvent) async* {
    if (currentState is CounterLoaded) {
      final int counter = (currentState as CounterLoaded).counter - counterEvent.counter;
      yield CounterLoaded(counter);
      _print(counter);
    }
  }

  void _print(int counter) {
    print(counter);
  }
}
