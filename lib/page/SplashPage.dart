import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/AppState.dart';
import 'dart:async';
import '../dao/UserDao.dart';
import '../utils/NavigatorUtils.dart';

///App 的第一屏
class SplashPage extends StatefulWidget {
  static final String sName = "/";

  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  bool isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //防止多次初始化
    if (isInit) return;
    isInit = true;
    Store<AppState> state = StoreProvider.of(context);
    new Future.delayed(new Duration(seconds: 2), () {
      UserDao.initUserInfo(state).then((res) {
        if (res.data != null && res.result) {
          NavigatorUtils.toHome(context);
        } else {
          NavigatorUtils.toLogin(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Image(image: new AssetImage("static/images/welcome.png")),
      ),
    );
  }
}
