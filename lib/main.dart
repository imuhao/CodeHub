import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/AppState.dart';
import 'model/User.dart';
import 'page/SplashPage.dart';
import 'page/LoginPage.dart';
import 'page/HomePage.dart';
void main() {
  runApp(new CodeHubApp());
}

class CodeHubApp extends StatelessWidget {
  final state = new Store<AppState>(appReducer,
      initialState: new AppState(userInfo: User.empty()));

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: state,
        //使用Store直接构建一个 Widget
        child: new StoreBuilder<AppState>(builder: (context, store) {
          return new MaterialApp(
            theme:ThemeData(
                primaryColor: Colors.green
            ),
            routes: {
              SplashPage.sName: (context) {
                return SplashPage();
              },
              LoginPage.sName: (context) {
                return LoginPage();
              },
              HomePage.sName:(context){
                return HomePage();
              }
            },
          );
        }));
  }
}
