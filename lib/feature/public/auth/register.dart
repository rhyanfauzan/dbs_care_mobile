// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_asset.dart';
import '../widget/button.dart';
import '../widget/image_upload.dart';
import '../widget/input_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ImageUploadController imageController =
        Get.put(ImageUploadController());

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
                      controller: _nameController, hintText: 'Nama Lengkap')),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: NumericField(
                    controller: _noHpController, hintText: 'Nomor Handphone'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: PasswordField(
                    controller: _passwordController, hintText: 'Password'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: InputField(
                    controller: _alamatController, hintText: 'Alamat'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: DateField(
                  controller: _dateController,
                  hintText: 'Tanggal Lahir',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child:
                    NumericField(controller: _nikController, hintText: 'NIK'),
              ),
              Container(height: 15),
              ImageUploadField(controller: imageController),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonPrimary(
                  name: 'Register',
                  onTap: () => register(
                      imageController,
                      _nameController,
                      _noHpController,
                      _passwordController,
                      _alamatController,
                      _dateController,
                      _nikController),
                ),
              ),
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
}

void register(
    ImageUploadController imageController,
    TextEditingController nameController,
    TextEditingController noHpController,
    TextEditingController passwordController,
    TextEditingController alamatController,
    TextEditingController dateContoller,
    TextEditingController nikController) {
  print(imageController.image);
  print(nameController.text);
  print(noHpController.text);
  print(passwordController.text);
  print(alamatController.text);
  print(dateContoller.text);
  print(nikController.text);
}

void login() {
  Get.toNamed('/login');
}
