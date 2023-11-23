import 'package:hive_flutter/hive_flutter.dart';

import 'configs/constants/app_hive_box.dart';
import 'domain/entities/user.dart';

class AppInitializers {
  const AppInitializers._();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<User>(UserAdapter());
    await Hive.openBox(HiveBoxStrings.userBoxName);
    await Hive.openBox(HiveBoxStrings.currentUserBoxName);
    await Hive.openBox(HiveBoxStrings.cookieBoxName);
  }
}
