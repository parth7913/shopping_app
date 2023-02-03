import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reativestate/Screen/View/HomePage.dart';
import 'package:reativestate/Screen/View/ShowHomePage.dart';

import 'Screen/View/cartPage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'S': (context) => ShowHomePage(),
        'C': (context) => CartPage(),
      },
    ),
  );
}
