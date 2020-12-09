import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String routeName, Object arg) {
    //pushNamed -> ngereplace halaman sebelumnya (buat menghemat memory)
    //push -> 
    navigatorKey.currentState.pushNamed(routeName, arguments: arg);
  }
  static back() => navigatorKey.currentState.pop();
}