import '../config/Config.dart';
import '../local/LocalStorge.dart';
import 'package:dio/dio.dart';
import 'dart:collection';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  ///发起网络请求
  static netFetch(url, params, Map<String, String> header, Options option,
      {noTip = false}) async {
    Map<String, String> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    //授权码
    if (optionParams["authorizationCode"] == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        optionParams["authorizationCode"] = authorizationCode;
      }
    }

    headers["Authorization"] = optionParams["authorizationCode"];
    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    Dio dio = new Dio();
    Response response;
  }

  ///清除授权
  static clearAuthorization() {
    optionParams["authorizationCode"] = null;
    LocalStore.remove(Config.TOKEN_KEY);
  }

  //获取授权 token

  static getAuthorization() async {
    String token = await LocalStore.get(Config.TOKEN_KEY);
    if (token == null) {
      String basic = await LocalStore.get(Config.USER_BASIC_CODE);

      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else {
      optionParams["authorizationCode"] = token;
      return token;
    }
  }
}
