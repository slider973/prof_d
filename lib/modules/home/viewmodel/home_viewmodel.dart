import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/navigate.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import '../../../shared/component/child_dashboard_component/sections/card_time_tableList_section.dart';
import '../../appointement/repos/time_table_repo.dart';

final homeViewModelViewModelProvider =
    ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel(ref));

class HomeViewModel extends ChangeNotifier {
  final TimeTableRepo _timeTableRepo = TimeTableRepo.instance;
  final Ref ref;
  late MainCoreViewModel _mainCoreVM;

  HomeViewModel(this.ref) {
    _mainCoreVM = ref.watch(mainCoreViewModelProvider.notifier);
  }

  getCurrentUser() {
    print('HomeViewModel.getCurrentUser');
    _mainCoreVM.getCurrentUser();
  }

  getTimeTableAndSlot() async {
    final timeTableList = await _timeTableRepo.getTimeTable();
    return timeTableList.body;
  }

  getAppointment() async {
    final appointmentList = await _timeTableRepo.getAppointment();
    return appointmentList.body;
  }

  navigateToCreateAppointment(BuildContext context) {
    NavigateUtils.instance.navigationFromTheBottomAnimation(context,
        const CardTimeTableListSection()
    );
  }
}
