// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../core/domain/api_url.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  final String custId = GetStorage().read('custId') ?? '';
  final String nama = GetStorage().read('nama') ?? '';
  final String ktpNo = GetStorage().read('ktpNo') ?? '';
  final String hpNo = GetStorage().read('hpNo') ?? '';
  final String tglLahir = GetStorage().read('tglLahir') ?? '';
  final String photo = GetStorage().read('photo') ?? '';

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    print('photo : $urlImage$photo');
  }

  Future<void> logout() async {
    isLoading.value = true;

    final String? token = GetStorage().read('token');
    if (token == null) {
      print('Token is null');
      isLoading.value = false;
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'accept': '*/*',
          'Authorization': 'Bearer $token',
          'X-CSRF-TOKEN': '',
        },
      );
      final context = Get.context;
      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        if (context != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logout successful')),
          );
        }
        GetStorage().remove('token');
        Get.offAllNamed('/home');
      } else {
        if (context != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Logout failed, ${jsonResponse['message']}')),
          );
        }
      }
    } catch (error) {
      print('Logout failed: [Catch] $error');
    } finally {
      isLoading.value = false;
    }
  }
}
