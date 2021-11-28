class CounterState {
  final int count;

  CounterState(this.count);

  factory CounterState.initial() => CounterState(0);

  CounterState copyWith({required int count}) => CounterState(count);

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
          count == other.count;

  @override
  int get hashCode => super.hashCode ^ runtimeType.hashCode ^ count.hashCode;

  @override
  String toString() => "CounterState { loading: $count}";
}
