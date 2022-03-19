import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../authentification/viewmodels/auth_viewmodel.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
final authViewModel =
ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel(ref));
class HomeViewModel extends ChangeNotifier {
  final Ref ref;
  late MainCoreViewModel _mainCoreVM;

  HomeViewModel(this.ref) {
    _mainCoreVM = ref.read(mainCoreViewModel);
  }
}
