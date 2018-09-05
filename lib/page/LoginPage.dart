import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:async';
import '../redux/AppState.dart';
import '../utils/NavigatorUtils.dart';
import '../utils/CommonUtils.dart';
import '../dao/UserDao.dart';
import '../model/DataResult.dart';

class LoginPage extends StatelessWidget {
  static final String sName = "login";

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: "hero",
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset("static/images/logo.png"),
        ));

    final etNameController = new TextEditingController();
    final etPwdController = new TextEditingController();

    final inputNameWidget = new TextField(
      autofocus: false,
      controller: etNameController,
      decoration: new InputDecoration(
        hintText: "请输入帐号",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final inputPwdWidget = new TextField(
      autofocus: false,
      obscureText: true,
      controller: etPwdController,
      decoration: new InputDecoration(
          hintText: "请输入密码",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.lightBlueAccent.shade100,
          elevation: 5.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            onPressed: () {
              String email = etNameController.value.text.trim();
              String pwd = etPwdController.value.text.trim();
              if (email == null ||
                  email.length == 0 ||
                  pwd == null ||
                  pwd.length == 0) return;
              CommonUtils.showLoadingDialog(context);
              Store store = StoreProvider.of(context);
              UserDao.login(email, pwd, store).then((DataResult res) {
                if (res != null && res.result) {
                  Navigator.pop(context);
                  new Future.delayed(const Duration(seconds: 1), () {
                    NavigatorUtils.toHome(context);
                    return true;
                  });
                }
              });
            },
            color: Colors.lightBlueAccent,
            child: Text('登录', style: TextStyle(color: Colors.white)),
          ),
        ));

    return new StoreBuilder<AppState>(builder: (context, store) {
      return new Container(
          child: Card(
        child: new Center(
            child: Padding(
          padding: EdgeInsets.all(24.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              logo,
              SizedBox(
                height: 48.0,
              ),
              inputNameWidget,
              SizedBox(
                height: 12.0,
              ),
              inputPwdWidget,
              SizedBox(
                height: 20.0,
              ),
              loginButton
            ],
          ),
        )),
      ));
    });
  }
}
