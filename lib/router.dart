import 'package:absensi/shared/shareds.dart';
import 'package:absensi/ui/pages/pages.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings setting){
  switch (setting.name) {
    case LoginRoute:
      return MaterialPageRoute(builder: (context)=> LoginPage());
      break;
    case HomeRoute:
      return MaterialPageRoute(builder: (context)=> HomePage());
    default:
      return MaterialPageRoute(builder: (context)=> UnknownPage());
  }
}