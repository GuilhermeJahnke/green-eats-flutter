import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../configs/constants/app_hive_box.dart';
import '../../../domain/entities/user.dart';
import 'local_datasource.dart';

class LocalDatasourceImpl implements LocalDatasource {
  final userbox = Hive.box(HiveBoxStrings.userBoxName);
  final currentUserBox = Hive.box(HiveBoxStrings.currentUserBoxName);

  @override
  Future<String?> getCookie() async {
    debugPrint('Get Cookie');

    return 'Oi';
  }

  @override
  Future<void> setCookie(String cookie) async {
    debugPrint('Set Cookie');

    return;
  }

  @override
  Future<void> updateHiveUser(User user) async {
    try {
      debugPrint('Saving user...');
      await userbox.put(user.id, user);

      debugPrint('User saved successfully ✅');

      debugPrint('Updating current user...');
      await currentUserBox.put(
        HiveBoxStrings.currentUserBoxName,
        user.id,
      );

      debugPrint('Current user updated successfully ✅');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User?> getCurrentHiveUser() async {
    try {
      final String? userId = currentUserBox.get(
        HiveBoxStrings.currentUserBoxName,
      );

      final User? user = userbox.get(userId);

      return user;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> clearHiveUser() async {
    try {
      await userbox.clear();
      await currentUserBox.clear();
    } catch (error) {
      rethrow;
    }
  }
}
