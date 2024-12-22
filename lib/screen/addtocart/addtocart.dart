import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/recipe_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Add To Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.addToCartList.isEmpty) {
          return const Center(
              child: Image(
                  image: NetworkImage(
                      "https://www.maloosgourmet.com/img/empty_cart.gif")));
        }
        return ListView.builder(
          itemCount: controller.addToCartList.length,
          itemBuilder: (context, index) {
            var item = controller.addToCartList[index];
            return Card(
              color: Colors.black,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(item.image),
                ),
                title: Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Price: \$${item.rating}",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    controller.removeFromCart(item: item);
                    Get.snackbar(
                      "Removed",
                      "${item.name} removed ",
                      backgroundColor: Colors.red.shade50,
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
