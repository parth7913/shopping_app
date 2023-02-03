import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reativestate/Screen/Controller/HomeController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    Get.put(HomeController()).loadJson();
  }

  @override
  Widget build(BuildContext context) {

    print("${homeController.CartList.length}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "ShopZone",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed('C');
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Obx(
                      ()=> Text(
                        "${homeController.totalCart.value}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Obx(
          () => GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: homeController.l1!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  homeController.h1 = homeController.l1![index];
                  Get.toNamed('S');
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "${homeController.l1![index].image}",
                        height: 130,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("${homeController.l1![index].title}"),
                      Text(
                        "\$ ${homeController.l1![index].price}",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
