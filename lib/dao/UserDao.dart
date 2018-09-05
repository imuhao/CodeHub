import 'package:redux/redux.dart';
import 'package:flutter_codehub/model/DataResult.dart';
import '../config/Config.dart';
import '../local/LocalStorge.dart';
import 'dart:async';

class UserDao {
  ///初始化用户信息
  static Future<DataResult> initUserInfo(Store store) async {
    var token = await LocalStore.get(Config.TOKEN_KEY);
    return DataResult(null, false, null);
  }

  static login(email, password, store) async {
    return DataResult(null, false, null);
  }
}
