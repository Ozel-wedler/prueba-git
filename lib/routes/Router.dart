import 'package:cashflow/pages/HomePage.dart';
import 'package:cashflow/pages/Login.dart';
import 'package:cashflow/pages/UiDesign_1.dart';
import 'package:cashflow/pages/ViewChecking.dart';
import 'package:cashflow/pages/ViewTransation.dart';
import 'package:cashflow/pages/ViewUser.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const root = "ui1";

  static Map<String, Widget Function(BuildContext)> routers = {
    "home": (_) => HomePage(),
    "login": (_) => Login(),
    "view": (_) => ViewUser(),
    "viewtransation": (_) => ViewTransation(),
    "viewChecking": (_) => ViewChecking(),
    "ui1": (_) => UiDesign1()
  };
}
