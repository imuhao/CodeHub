
import 'package:flutter/material.dart';
class NavigatorUtils{

  //跳转到登录页面
  static toLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, "login");
  }

  //跳转到主页面
  static toHome(BuildContext context){
    Navigator.pushReplacementNamed(context, "home");
  }

}