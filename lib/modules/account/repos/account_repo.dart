import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_prof_d/api_json.swagger.dart';
import '../../../authentification/services/api_json_caller.dart';

import '../../../core/services/init_services/auth_service.dart';

final accountRepositoryProvider = Provider((ref) => AccountRepo.instance);
class AccountRepo {
  final AuthService _authService = AuthService.instance;

  AccountRepo._();

  static final AccountRepo instance = AccountRepo._();

 Future<List> getChildList() async {
    final userToken = await _authService.getUserTokenApiStored();
    final ApiJson apiJson =
        ApiJsonCaller.instance.getInstanceWithAuth(userToken!)!;
    final result = await apiJson.childGet();
    return result.body;
  }

  addChild(AddChildDto newChild) async {
    final userToken = await _authService.getUserTokenApiStored();
    final ApiJson apiJson =
        ApiJsonCaller.instance.getInstanceWithAuth(userToken!)!;
    final result = await apiJson.childAddChildToParentPost(body: newChild);
    if (result.statusCode == 200 | 201) {
      if (result.body != null) {
       return result.body;
      }
    }
  }
}


