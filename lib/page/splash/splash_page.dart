import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix/page/home/home_binding.dart';
import 'package:pix/page/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      // width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
            fontSize: 35.0, fontFamily: 'Bobbers', color: Colors.green),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText('P', duration: const Duration(seconds: 1)),
            FadeAnimatedText('Pi', duration: const Duration(seconds: 1)),
            FadeAnimatedText('PiX', duration: const Duration(seconds: 1)),
          ],
          onTap: () {},
        ),
      ),
    )));
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 5),
        () => Get.off(() => const HomePage(), binding: HomeBinding()));
    super.initState();
  }
}
