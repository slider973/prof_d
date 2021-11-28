class CounterAction {
  @override
  String toString() {
    return 'CounterAction { }';
  }
}
// One simple action: Increment

class CounterAddActions {
  int increment;

  CounterAddActions(this.increment);

  @override
  String toString() {
    return 'CounterAction { $increment}';
  }
}
