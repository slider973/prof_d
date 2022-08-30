import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api_prof_d/api_json.models.swagger.dart';
import '../../core/services/navigation_service.dart';
import '../../core/utils/navigate.dart';
import '../models/follow_up_subject.dart';
import '../models/reponse_fetch_get.dart';
import '../models/result_follow_up_child.dart';
import '../repos/admin_repo.dart';
import '../screens/add_following_screen.dart';
import '../screens/create_follow_up.dart';

final followingViewModelProvider = ChangeNotifierProvider<FollowingViewModel>(
    (ref) => FollowingViewModel(ref));

class FollowingViewModel extends ChangeNotifier {
  final Ref ref;
  final AdminRepo _adminRepo = AdminRepo.instance;

  List<FollowUpSubject> followingSubject = [];
  CreateFollowUpDetailDto createFollowUpDetailDto =
      CreateFollowUpDetailDto(followUpSubjects: [], appointment: null);

  FollowingViewModel(this.ref);

  Future<List<FollowUpSubject>> getFollowSubject() async {
    if (followingSubject.isNotEmpty) {
      return followingSubject;
    }
    final resultGetFollowSubjectRequest = await _adminRepo.getFollowSubject();
    final response = ResponseFetchGetFollowUpSubject.fromJson(
        resultGetFollowSubjectRequest.body);
    followingSubject = response.result;
    return followingSubject;
  }

  sendFollowUpDetail() async {
    final resultGetFollowSubjectRequest =
        await _adminRepo.sendFollowUpDetails(createFollowUpDetailDto);
    goBackAndResetData();
    return resultGetFollowSubjectRequest.body;
  }

  navigateToAddFollowingScreen(String idAppointment) {
    NavigateUtils.instance.navigationToPageScreen(() => AddFollowingScreen(
          idAppointment: idAppointment,
        ));
  }

  setFollowupDetail(String idAppointment) {
    createFollowUpDetailDto =
        createFollowUpDetailDto.copyWith(appointment: idAppointment);
  }

  addFollowUpSubject(String idFollowUpSubject) {
    createFollowUpDetailDto.followUpSubjects.add(idFollowUpSubject);
  }

  removeFollowUpSubject(String idFollowUpSubject) {
    createFollowUpDetailDto.followUpSubjects.remove(idFollowUpSubject);
  }

  goCreateFollowUp(BuildContext context) {
    NavigateUtils.instance.navigationFromTheBottomAnimation(
        context, const CreateFollowUpScreen());
  }

  Future<ResultFollowUpChild> getFollowUp(String id) async {
    final summaryResponseChildSelected =
        await _adminRepo.getFollowUpByChild(id);

    return ResultFollowUpChild.fromJson(summaryResponseChildSelected.body);
  }

  goBackAndResetData() {
    createFollowUpDetailDto =
        CreateFollowUpDetailDto(followUpSubjects: [], appointment: null);
    NavigationService.goBack();
  }
}
