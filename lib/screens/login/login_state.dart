import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:pe_food_app/services/login_service.dart';

class LoginState extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  onEmailChange(String value) {
    email.value = value;
  }

  onPasswordChange(String value) {
    password.value = value;
  }

  onLogin() async {
    isLoading.value = true;
    try {
      final user = await LoginService().login(email.value, password.value);
      isLoading.value = false;
      LoginService().cacheUser(user);
      return user;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}
