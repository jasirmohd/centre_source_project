import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix/page/home/home_binding.dart';
import 'package:pix/page/home/home_page.dart';
import 'package:pix/page/image_view/image_view_binding.dart';
import 'package:pix/page/image_view/image_view_page.dart';
import 'package:pix/page/splash/splash_page.dart';
import 'package:pix/res/values/strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final pages = [
    GetPage(name: Strings.tSplashPage, page: () => const SplashPage()),
    GetPage(
        name: Strings.tHomePage,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Strings.tImageViewPage,
        page: () => ImageViewPage(),
        binding: ImageViewBinding()),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.tAppName,
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialRoute: Strings.tSplashPage,
    );
  }
}
