import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pe_food_app/common/constants.dart';
import 'package:pe_food_app/common/fonts.dart';
import 'package:pe_food_app/common/strings.dart';
import 'package:pe_food_app/screens/home/home_state.dart';
import 'package:pe_food_app/screens/home/widgets/food_category_section.dart';
import 'package:pe_food_app/services/login_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeState homeState = Get.find();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Constants.primaryColor,
          title: Text(Strings.home, style: Fonts.sb16.copyWith(color: Colors.white, fontSize: 18)),
          actions: [
            TextButton(
                onPressed: () {
                  LoginService().logout();
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: Text(Strings.logout, style: Fonts.sb16.copyWith(color: Colors.white)))
          ],
        ),
        body: Stack(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
                child: SearchBar(hintText: Strings.search, controller: searchController, trailing: [
                  IconButton.filled(
                      onPressed: () {
                        homeState.onSearch(searchController.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      color: Constants.primaryColor,
                      icon: const Icon(Icons.search, color: Colors.white))
                ])),
            Obx(
              () => homeState.isLoading.isTrue
                  ? const Center(child: CircularProgressIndicator(color: Constants.primaryColor))
                  : Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: SingleChildScrollView(
                          child: Column(children: [
                        const SizedBox(height: 8),
                        ...homeState.results.keys
                            .map(
                                (e) => FoodCategorySection(categoryName: e, categoryItems: homeState.results.value[e]!))
                            .toList()
                      ])),
                    ),
            )
          ],
        ));
  }
}
