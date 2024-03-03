import 'package:dbs_care/feature/public/widget/button.dart';
import 'package:dbs_care/feature/public/widget/input_field.dart';
import 'package:flutter/material.dart';

import '../../../config/app_asset.dart';
import '../../../config/theme.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

   final TextEditingController _nameController = TextEditingController();
   final TextEditingController _noHpController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _alamatController = TextEditingController();
   final TextEditingController _nikController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
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
            Text('Register',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
            ),
            Container(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: InputField(controller: _nameController, hintText: 'Nama Lengkap',),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: InputField(controller: _noHpController, hintText: 'Nomor Handphone',),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: InputField(controller: _passwordController, hintText: 'Password',),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: InputField(controller: _alamatController, hintText: 'Alamat',),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: InputField(controller: _nikController, hintText: 'NIK',),
            ),
            Container(height: 20,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ButtonPrimary(name: 'Register', url: '/register',),
            ),
            Container(height: 5,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ButtonSecondary(name: 'Login', url: '/login',),
            ),
          ],
        ),
      ),
    );
  }
}