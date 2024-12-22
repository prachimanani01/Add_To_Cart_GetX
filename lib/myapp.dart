import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_getx_app/screen/addtocart/addtocart.dart';
import 'package:recipe_getx_app/screen/homepage/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cart',
          page: () => const CartPage(),
        ),
      ],
    );
  }
}
