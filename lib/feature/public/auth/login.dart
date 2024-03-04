import 'package:dbs_care/feature/public/widget/button.dart';
import 'package:dbs_care/feature/public/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_asset.dart';
import '../../../config/theme.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

   final TextEditingController _noHpController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 30,),
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
                    Text('DBS Care',
                    style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 24),
                    ),
                  ],
                ),
              ),
              Container(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  AppAsset.ilLogin, 
                  width: 220,
                ),
              ),
              Container(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: NumericField(controller: _noHpController, hintText: 'Nomor Handphone',),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: PasswordField(controller: _passwordController, hintText: 'Password',),
              ),
              Container(height: 20,),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonPrimary(name: 'Login', onTap: () => login(),),
              ),
              Container(height: 5,),
               const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ButtonSecondary(name: 'Register', url: '/register',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void register() {
  Get.toNamed('/register');
}

void login() {
  Get.toNamed('/');
}