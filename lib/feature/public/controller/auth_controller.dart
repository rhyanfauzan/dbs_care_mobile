// ignore_for_file: avoid_print, unnecessary_null_comparison


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLogin = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  // REGISTER

  final nameController = TextEditingController();
  final noHpController = TextEditingController();
  final passwordController = TextEditingController();
  final alamatController = TextEditingController();
  final dateController = TextEditingController();
  final nikController = TextEditingController();

}
