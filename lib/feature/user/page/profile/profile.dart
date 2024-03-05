// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dbs_care/feature/public/widget/button.dart';

class ProfilePage extends StatelessWidget {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(() {
              if (profileController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return ButtonPrimary(
                  name: 'Logout',
                  onTap: () => profileController.logout(),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

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
        Uri.parse('https://dbs.careersinformation.org/api/logout'),
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
        print(jsonResponse['message']);
        Get.offAllNamed('/');
      } else {
        if (context != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Logout failed, ${jsonResponse['message']}')),
          );
        }
        print('Logout failed: ${jsonResponse['message']}');
      }
    } catch (error) {
      print('Logout failed: [Catch] $error');
    } finally {
      isLoading.value = false;
    }
  }
}
