import 'counter/counter.reducer.dart';
import './login/login.reducer.dart';

import './app.state.dart';

AppState appReducer(AppState state, action) => AppState(
      loginState: loginReducer(state.loginState, action),
      counterState: counterReducer(state.counterState, action),
    );
