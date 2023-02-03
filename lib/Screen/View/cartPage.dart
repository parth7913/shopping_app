import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reativestate/Screen/Model/HomeModel.dart';

import '../Controller/HomeController.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: ListView.builder(
          itemCount: homeController.CartList.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage("${homeController.CartList[index].image}"),
            ),
            title: Text("${homeController.CartList[index].title}"),
            trailing: SizedBox(
              width: 180,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      HomeModel homeMOdel = HomeModel(
                          title: homeController.CartList[index].title,
                          qua: homeController.CartList[index].qua! + 1);
                      homeController.CartList[index] = homeMOdel;
                      print("${homeController.CartList}");
                    },
                    icon: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Obx(() => Text("${homeController.CartList[index].qua}")),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (homeController.CartList[index].qua != 0) {
                          homeController.CartList[index].qua =
                              homeController.CartList[index].qua! - 1;
                        }
                        if (homeController.CartList[index].qua == 0) {
                          homeController.CartList.value.removeAt(index);
                        }
                      });
                    },
                    icon: Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        homeController.CartList.value.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
