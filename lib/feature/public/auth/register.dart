// ignore_for_file: avoid_print, non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:dbs_care/config/app_format.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../config/app_asset.dart';
import '../../../core/domain/api_url.dart';
import '../controller/auth_controller.dart';
import '../widget/button.dart';
import '../widget/image_upload.dart';
import '../widget/input_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());
  final ImageUploadController imageController = ImageUploadController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 30),
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
              Container(height: 30),
              Text(
                'Register',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
              ),
              Container(height: 10),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: InputField(
                      controller: authController.nameController,
                      hintText: 'Nama Lengkap')),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: NumericField(
                    controller: authController.noHpController,
                    hintText: 'Nomor Handphone'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: PasswordField(
                    controller: authController.passwordController,
                    hintText: 'Password'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: InputField(
                    controller: authController.alamatController,
                    hintText: 'Alamat'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: DateField(
                  controller: authController.dateController,
                  hintText: 'Tanggal Lahir',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: NumericField(
                    controller: authController.nikController, hintText: 'NIK'),
              ),
              Container(height: 15),
              ImageUploadField(controller: imageController),
              Container(height: 20),
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
                        name: 'Register',
                        onTap: () {
                          if (authController.nameController.text.isNotEmpty &&
                              authController.noHpController.text.isNotEmpty &&
                              authController
                                  .passwordController.text.isNotEmpty &&
                              authController.nikController.text.isNotEmpty &&
                              authController.dateController.text.isNotEmpty &&
                              imageController.image != null) {
                            authController.isLoading.value = true;
                            register(
                              context: context,
                              name: authController.nameController.text,
                              phoneNumber: authController.noHpController.text,
                              password: authController.passwordController.text,
                              nik: authController.nikController.text,
                              dateOfBirth: AppFormat().convertDateFormat(
                                  authController.dateController.text),
                              imageFile: imageController.image!,
                            );
                          } else {
                            authController.isLoading.value = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Semua data harus diisi termasuk gambar!')),
                            );
                          }
                        }),
                  );
                }
              }),
              Container(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonSecondary(
                  name: 'Login',
                  onTap: () => login(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register({
    required BuildContext context,
    required String name,
    required String phoneNumber,
    required String password,
    required String nik,
    required String dateOfBirth,
    required File imageFile,
  }) async {
    try {
      // Create a multipart request
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/register'));

      print('dateOfBirth $dateOfBirth');

      // Add form fields
      request.fields['nama'] = name;
      request.fields['no_hp'] = phoneNumber;
      request.fields['password'] = password;
      request.fields['password_confirmation'] = password;
      request.fields['no_ktp'] = nik;
      request.fields['tgl_lahir'] = dateOfBirth;

      print("request.fields['tgl_lahir'] : ${request.fields['tgl_lahir']}");

      // Add image file
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile('photo', stream, length,
          filename: imageFile.path.split('/').last);
      request.files.add(multipartFile);

      // Send the request
      var response = await http.Response.fromStream(await request.send());
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      // Parse the JSON response
      print('response : $response');
      print('response statusCode : ${response.statusCode}');

      // Check the response status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Registration successful
        print('Response : ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Registration Successful',
              style: blackTextStyle,
            ),
            backgroundColor: greenColor,
          ),
        );
        Get.offAllNamed('/login');
      } else {
        // Registration failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Registration failed ${responseJson['message']}',
              style: whiteTextStyle,
            ),
            backgroundColor: redColor,
          ),
        );
        print('Registration failed: ${response.body}');
      }
    } catch (e) {
      // Error occurred during registration
      print('Error registering user: $e');
    }
    authController.isLoading.value = false;
  }

  void login() {
    Get.toNamed('/login');
  }
}
