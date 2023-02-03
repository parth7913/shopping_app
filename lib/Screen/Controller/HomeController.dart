import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/HomeModel.dart';

class HomeController extends GetxController {
  RxList<dynamic>? l1 = <dynamic>[].obs;

  void loadJson() async {
    var jsonString = await rootBundle.loadString('assets/json/product.json');
    var json = jsonDecode(jsonString);
    l1!.value = json.map((e) => HomeModel().jsonFrom(e)).toList();
  }

  HomeModel? h1;
  RxInt totalCart = 0.obs;
  RxList<HomeModel> CartList = <HomeModel>[].obs;
}
