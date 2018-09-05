import 'package:redux/redux.dart';
import 'package:flutter_codehub/model/DataResult.dart';
import '../config/Config.dart';
import '../local/LocalStorge.dart';
import '../config/NetConfig.dart';
import 'dart:async';
import 'dart:convert';

class UserDao {
  ///初始化用户信息
  static Future<DataResult> initUserInfo(Store store) async {
    var token = await LocalStore.get(Config.TOKEN_KEY);
    return DataResult(null, false, null);
  }

  static login(email, password, store) async {
    String type = email + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);

    await LocalStore.save(Config.USER_NAME_KEY, email);
    await LocalStore.save(Config.USER_BASIC_CODE, base64Str);

    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": NetConfig.CLIENT_ID,
      "client_secret": NetConfig.CLIENT_SECRET
    };

    //根据用户帐号密码生成USER_BASIC_CODE
    //将帐号,密码,USER_BASIC_CODE保存到本地
    //删除之前的授权信息
    //请求网络 -> 判断是否有网,没网返回空数据  ->

    return DataResult(null, false, null);
  }
}
