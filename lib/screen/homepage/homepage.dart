import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_getx_app/screen/addtocart/addtocart.dart';

import '../../controller/recipe_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeController controller = Get.put(RecipeController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Recipe App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(
              () => CartPage(),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  CupertinoIcons.shopping_cart,
                  color: Colors.white,
                  size: 30,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Transform.translate(
                      offset: const Offset(0, -2),
                      child: Obx(
                        () => Text(
                          "${controller.addToCartList.length}",
                          style: const TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: (controller.recipelist.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var item = controller.recipelist[index];
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 180,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Text(
                                item.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$ ${item.rating}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black,
                          child: IconButton(
                            icon: const Icon(
                              CupertinoIcons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                            onPressed: () =>
                                controller.addRecipeToCart(item: item),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: controller.recipelist.length,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
