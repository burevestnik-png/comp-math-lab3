import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:comp_math_lab3/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab work',
      theme: ThemeData.light(),
      home: AnimatedSplashScreen(
        nextScreen: MainScreen(),
        splash: 'images/yarki.png',
        duration: 500,
        splashTransition: SplashTransition.fadeTransition,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(MainScreenState());
      }),
      getPages: [
        GetPage(name: MainScreen.id, page: () => MainScreen()),
      ],
    );
  }
}
