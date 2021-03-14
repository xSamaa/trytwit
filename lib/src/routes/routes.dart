import 'package:flutter/material.dart';
import 'package:twitsam/src/pages/home_page.dart';

import 'package:twitsam/src/pages/login_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'alert': (BuildContext context) => HomePage(),
    // 'avatar': (BuildContext context) => AvatarPage(),
    // 'card': (BuildContext context) => CardPage(),
  };
}
