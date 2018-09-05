import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class CommonUtils {
  ///显示一个正在加载的 Dialog
  static Future<Null> showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new Material(
              color: Colors.transparent,
              child: new WillPopScope(
                  child: new Center(
                    child: new Container(
                      width: 200.0,
                      height: 200.0,
                      padding: new EdgeInsets.all(4.0),
                      decoration: new BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: SpinKitCubeGrid(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          new Container(
                            height: 10.0,
                          ),
                          new Container(
                            child: new Text(
                              "正在加载...",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  onWillPop: () => Future.value(false)));
        });
  }
}
