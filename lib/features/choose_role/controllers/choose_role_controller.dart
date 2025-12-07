import 'package:alora/core/config/app_constants.dart';
import 'package:alora/core/enums/role_type.dart';
import 'package:alora/core/routes/app_routes.dart';
import 'package:alora/core/storage/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleItem {
  final String name;
  final RoleType role;
  bool isSelected;

  RoleItem({required this.name, required this.role, this.isSelected = false});

  // Optional: CopyWith for immutability (useful in some state patterns)
  RoleItem copyWith({String? name, RoleType? role, bool? isSelected}) {
    return RoleItem(
      name: name ?? this.name,
      role: role ?? this.role,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class ChooseRoleController extends GetxController {
  final SecureStorageService _storage;

  ChooseRoleController(this._storage);

  Rx<RoleType> roleType = RoleType.renter.obs;

  void updateRoleType(RoleType roleType, bool? value) {
    if (value != null && value == true) {
      this.roleType.value = roleType;
    }
  }

  RxBool isRoleTypeMatch(RoleType roleType) {
    if (this.roleType.value == roleType) {
      return RxBool(true);
    }
    return RxBool(false);
  }

  Future<void> handleContinue() async {
    await _storage.write(AppConstants.roleType, roleType.value.name);
    if (roleType.value == RoleType.agent || roleType.value == RoleType.crew) {
      Get.toNamed(AppRoutes.signInRoute);
      return;
    }
    Get.toNamed(AppRoutes.signUpRoute);
  }

  final GlobalKey<State<StatefulWidget>> buttonKey = GlobalKey();

  final RxList<RoleItem> items =
      <RoleItem>[
        RoleItem(name: 'Owner', role: RoleType.owner),
        RoleItem(name: 'Agent', role: RoleType.agent),
        RoleItem(name: 'Maintenance Crew', role: RoleType.crew),
      ].obs;

  void selectRole(RoleType role) {
    updateRoleType(role, true);

    for (int i = 0; i < items.length; i++) {
      // ignore: avoid_bool_literals_in_conditional_expressions
      items[i].isSelected = (items[i].role == role);
    }
  }

  void clearSelectionAndSelectRenter() {
    for (final RoleItem item in items) {
      item.isSelected = false;
    }
    roleType.value = RoleType.renter;
  }

  RoleItem? get selectedItem => items.firstWhereOrNull((RoleItem item) => item.isSelected);

  /// [onInit] Lifecycle method called when the controller is initialized.
  ///
  /// Resets loading states, clears existing data, and triggers and more..
  /// initial fetch
  ///
  @override
  void onInit() {
    super.onInit();
  }

  /// [dispose] Lifecycle method called when the controller is destroyed.
  ///
  /// Cleans up by resetting loading states and clearing lists and more...
  @override
  void dispose() {
    super.dispose();
  }
}
