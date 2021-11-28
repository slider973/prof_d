
import '../app.state.dart';
import 'package:redux/redux.dart';
import './counter.state.dart';
import 'counter.action.dart';

final counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, CounterAddActions>(_increment)
]);


CounterState _increment(CounterState counterState, CounterAddActions action) {
  return  CounterState(action.increment) ;
}

int counterSelector(AppState state) => state.counterState.count;