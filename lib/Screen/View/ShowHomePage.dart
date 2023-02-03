import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reativestate/Screen/Controller/HomeController.dart';

class ShowHomePage extends StatefulWidget {
  const ShowHomePage({Key? key}) : super(key: key);

  @override
  State<ShowHomePage> createState() => _ShowHomePageState();
}

class _ShowHomePageState extends State<ShowHomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Details of Product",
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5),
                height: 300,
                width: 300,
                child: Image.network("${homeController.h1!.image}"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${homeController.h1!.title}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${homeController.h1!.description}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  homeController.CartList.value.add(homeController.h1!);
                  homeController.totalCart.value=homeController.CartList.length;

                  Get.back();
                  Get.snackbar(
                      "Your Order Is Confirmed",
                      colorText: Colors.blue,
                      "Please Check Your Order Item In Cart",
                      backgroundColor: Colors.white);
                },
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
                label: Text("ADD TO CART"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
