import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pe_food_app/screens/home/home_screen.dart';
import 'package:pe_food_app/screens/home/home_state.dart';
import 'package:pe_food_app/screens/login/login_screen.dart';
import 'package:pe_food_app/screens/login/login_state.dart';
import 'package:pe_food_app/services/login_service.dart';

void main() async {
  // Init states

  Get.put(LoginState());
  Get.put(HomeState());

  await LoginService().initUser();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      initialRoute: LoginService.loggedInUser == null ? 'login' : 'home',
      routes: {'login': (context) => LoginScreen(), 'home': (context) => HomeScreen()},
    );
  }
}
