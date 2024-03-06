// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isLoading = true.obs;
  var isLogin = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    checkAuth();
  }

  // Check authentication by making HTTP request
  Future<void> checkAuth() async {
    final String? token = GetStorage().read('token');

    if (token != null) {
      try {
        final response = await http.get(
          Uri.parse('https://dbs.careersinformation.org/api/checkAuth'),
          headers: {
            'accept': '*/*',
            'Authorization': 'Bearer $token',
            'X-CSRF-TOKEN': '',
          },
        );

        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);

          print(jsonResponse['message']);
          print('token : $token');
          isLogin.value = true;
        } else {
          isLogin.value = false;
          GetStorage().remove('token');
          print('Token removed');
        }
      } catch (error) {
        print('Error while checking authentication: $error');
        isLogin.value = false;
        GetStorage().remove('token');
        print('Token removed due to error');
      }
    } else {
      isLogin.value = false;
      print('Token is null');
    }
    isLoading.value = false;
  }

  // Select gender on update profile
  var userGender = "Male".obs;
  void selectGender(String gender) {
    userGender.value = gender;
  }

  // Birthdate
  var birthdate = "".obs;
}
