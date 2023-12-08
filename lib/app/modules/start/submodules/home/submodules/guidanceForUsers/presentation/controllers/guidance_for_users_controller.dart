import 'package:flutter/material.dart';
import 'package:movecare/app/core/ui/widgets/app_loading.dart';

import '../../domain/entities/guidance_for_users_entity.dart';
import '../../domain/usecases/fetch_all_guidance_for_user_usecase.dart';

enum GuidanceForUsersControllerState { loading, success, error, empty }

class GuidanceForUsersController extends ChangeNotifier {
  GuidanceForUsersController({required this.fetchAllGuidanceForUserUsecase});
  final FetchAllGuidanceForUserUsecase fetchAllGuidanceForUserUsecase;

  GuidanceForUsersControllerState state = GuidanceForUsersControllerState.loading;

  List<GuidanceForUsersEntity> listGuidanceForUser = [];
  String errorMessage = '';

  Future<void> onInit() async {
    _fetchAllGuidanceForUser();
  }

  Future<void> _fetchAllGuidanceForUser() async {
    showAppLoading();
    final result = await fetchAllGuidanceForUserUsecase();
    hideAppLoading();

    result.fold((l) {
      errorMessage = l.errorMessage;
      state = GuidanceForUsersControllerState.error;
    }, (r) {
      listGuidanceForUser = r;
      state = r.isEmpty ? GuidanceForUsersControllerState.empty : GuidanceForUsersControllerState.success;
    });

    notifyListeners();
  }
}
