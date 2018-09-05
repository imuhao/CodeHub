import '../model/User.dart';

///全局 Redux  store对象,保存 store 数据

class AppState {
  User userInfo;

  AppState({this.userInfo});
}

///创建 Redux
AppState appReducer(AppState state, action) {}
