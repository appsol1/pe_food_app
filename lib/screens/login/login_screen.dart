import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pe_food_app/common/constants.dart';
import 'package:pe_food_app/common/fonts.dart';
import 'package:pe_food_app/common/strings.dart';
import 'package:pe_food_app/screens/login/login_state.dart';
import 'package:pe_food_app/widgets/alert_popup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginState state = Get.find();

  bool get isFormValid => state.email.isNotEmpty && state.password.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.bgColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(Strings.login, style: Fonts.sb16.copyWith(fontSize: 18)),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        body: Container(
            padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                  child: TextField(
                      style: Fonts.sb16,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: Strings.email,
                        labelStyle: Fonts.sb16.copyWith(color: Constants.secondryGray),
                        floatingLabelStyle: Fonts.regular13.copyWith(color: Constants.secondryGray),
                        border: InputBorder.none,
                      ),
                      onChanged: state.onEmailChange),
                ),
                const SizedBox(height: 16),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                  child: TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      style: Fonts.sb16,
                      decoration: InputDecoration(
                        labelText: Strings.password,
                        labelStyle: Fonts.sb16.copyWith(color: Constants.secondryGray),
                        floatingLabelStyle: Fonts.regular13.copyWith(color: Constants.secondryGray),
                        border: InputBorder.none,
                      ),
                      onChanged: state.onPasswordChange),
                ),
                const SizedBox(height: 16),
                Text(Strings.forgotPass,
                    textAlign: TextAlign.right, style: Fonts.sb16.copyWith(color: Constants.primaryColor)),
                const SizedBox(height: 30),
                Obx(() => ElevatedButton(
                    onPressed: isFormValid
                        ? () async {
                            try {
                              await state.onLogin();
                              Navigator.pushReplacementNamed(context, 'home');
                            } catch (e) {
                              AlertPopup.error(context, e.toString());
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isFormValid ? Constants.primaryColor : Constants.secondryGray,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                    child: state.isLoading.isTrue
                        ? const SizedBox(
                            width: 23,
                            height: 23,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.0))
                        : Text(Strings.login, style: Fonts.sb16.copyWith(color: Colors.white)))),
                const SizedBox(height: 24),
                Wrap(alignment: WrapAlignment.center, spacing: 4, children: [
                  Text(Strings.newMember, style: Fonts.sb16.copyWith(color: Constants.secondryGray)),
                  Text(Strings.createAccount, style: Fonts.sb16.copyWith(color: Constants.primaryColor))
                ])
              ],
            ))));
  }
}
