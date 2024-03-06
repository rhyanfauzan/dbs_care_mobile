// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, avoid_print

import 'dart:convert';

import 'package:dbs_care/config/app_format.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/core/domain/api_url.dart';
import 'package:dbs_care/feature/public/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dbs_care/feature/public/widget/button.dart';

class ProfilePage extends StatelessWidget {
  final profileController = Get.put(ProfileController());

  final String custId = GetStorage().read('custId') ?? '';
  final String nama = GetStorage().read('nama') ?? '';
  final String ktpNo = GetStorage().read('ktpNo') ?? '';
  final String hpNo = GetStorage().read('hpNo') ?? '';
  final String tglLahir = GetStorage().read('tglLahir') ?? '';
  final String photo = GetStorage().read('photo') ?? '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 65, bottom: 25),
          decoration: BoxDecoration(
              color: redColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
              child: Text(
            'Profile',
            style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          )),
        ),
        Container(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              DisplayField(
                hintText: 'Customer ID : $custId',
              ),
              DisplayField(
                hintText: 'Nama : $nama',
              ),
              DisplayField(
                hintText: 'NIK : $ktpNo',
              ),
              DisplayField(
                hintText: 'Tanggal Lahir : ${AppFormat.date(tglLahir)}',
              ),
              //  DisplayField(hintText: 'Alamat :',),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
        const Expanded(
            child: SizedBox(
          height: 10,
          width: double.infinity,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Obx(() {
            if (profileController.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return ButtonSecondary(
                name: 'Logout',
                onTap: () => profileController.logout(),
              );
            }
          }),
        )
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
