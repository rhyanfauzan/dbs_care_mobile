// ignore_for_file: must_be_immutable, unnecessary_brace_in_string_interps, avoid_print

import 'package:dbs_care/feature/public/page/daftar_harga.dart';
import 'package:dbs_care/feature/public/page/promo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:online_course_app/feature/public/auth/login_page.dart';
// import 'package:online_course_app/feature/public/auth/register_page.dart';
import 'config/theme.dart';
import 'feature/public/auth/login.dart';
import 'feature/public/auth/register.dart';
import 'feature/user/controller/user_controller.dart';
import 'feature/user/page/index.dart';
import 'feature/public/page/home.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // Getx Controller
  final UserController userController =
      Get.put(UserController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      routes: {
        // Cek main route menuju halaman login atau index
        '/': (context) {
          return Obx(() {
            if (userController.isLogin.isTrue) {
              print('isLogin ${userController.isLogin.value}, Login');
              return const Index();
            } else {
              print('isLogin ${userController.isLogin.value}, Index');
              Get.delete<UserController>();
              return HomePage();
            }
          });
        },
        // '/': (context) => const OnboardingPage(),
        '/index': (context) => const Index(),
        '/home': (context) => HomePage(),
        '/promo': (context) => PromoPage(),
        '/daftarharga': (context) => DaftarHargaPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
