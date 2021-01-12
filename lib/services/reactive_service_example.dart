import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class ReactiveServiceExample with ReactiveServiceMixin {
  RxValue<int> _counter = RxValue<int>(initial: 0);

  ReactiveServiceExample() {
    listenToReactiveValues([_counter]);
  }

  int get counter => _counter.value;

  void incrementCounter() {
    _counter.value++;
  }

  void doubleCounter() {
    _counter.value *= 2;
  }
}
