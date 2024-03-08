// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:dbs_care/feature/public/controller/auth_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dbs_care/feature/public/widget/button.dart';
import 'package:dbs_care/feature/public/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_asset.dart';
import '../../../config/theme.dart';
import '../../../core/domain/api_url.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final authController = Get.put(AuthController());

  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        AppAsset.logoIconDbs,
                        height: 30,
                      ),
                    ),
                    Text(
                      'DBS Care',
                      style: blackTextStyle.copyWith(
                          fontWeight: bold, fontSize: 24),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  AppAsset.ilLogin,
                  width: 220,
                ),
              ),
              Container(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: NumericField(
                  controller: _noHpController,
                  hintText: 'Nomor Handphone',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: PasswordField(
                  controller: _passwordController,
                  hintText: 'Password',
                ),
              ),
              Container(
                height: 20,
              ),
              Obx(() {
                if (authController.isLoading.value) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CircularProgressIndicator(
                      color: redColor,
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonPrimary(
                      name: 'Login',
                      onTap: () => _login(context),
                      // onTap: ()=> loginForce(),
                    ),
                  );
                }
              }),
              Container(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonSecondary(
                  name: 'Register',
                  onTap: () => register(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    authController.isLoading.value = true;
    final String noHp = _noHpController.text;
    final String password = _passwordController.text;

    // Validate input fields
    if (noHp.isEmpty || password.isEmpty) {
      authController.isLoading.value = false;
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter your phone number and password')),
      );
      return;
    }

    // Make POST request to login API
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'no_hp': noHp, 'password': password},
    );
    print(response);
    final jsonResponse = json.decode(response.body);
// Parse response JSON
    final bool isSuccess = jsonResponse['isSuccess'];
    final String message = jsonResponse['message'];
    if (response.statusCode == 200) {
      if (isSuccess) {
        // Login successful
        final String token = jsonResponse['data']['token'];
        final String custId = jsonResponse['data']['user']['CUST_ID'];
        final String nama = jsonResponse['data']['user']['NAMA'];
        final String ktpNo = jsonResponse['data']['user']['KTP_NO'];
        final String hpNo = jsonResponse['data']['user']['HP_NO'];
        final String tglLahir = jsonResponse['data']['user']['TGL_LAHIR'];
        final String photo = jsonResponse['data']['user']['PHOTO'];

        // Navigate to home screen or perform other actions
        // You can pass user data and token to the home screen if needed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: greenColor,
          ),
        );
        // Save token to local storage
        GetStorage().write('token', token);
        GetStorage().write('custId', custId);
        GetStorage().write('nama', nama);
        GetStorage().write('ktpNo', ktpNo);
        GetStorage().write('hpNo', hpNo);
        GetStorage().write('tglLahir', tglLahir);
        GetStorage().write('photo', photo);
        Get.offAllNamed('/index');
      } else {
        // Login failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } else {
      // Server error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login Failed ($message)',
            style: whiteTextStyle,
          ),
          backgroundColor: redColor,
        ),
      );
    }
    authController.isLoading.value = false;
  }

  void register() {
    Get.toNamed('/register');
  }

  void loginForce() {
    Get.toNamed('/index');
  }
}
