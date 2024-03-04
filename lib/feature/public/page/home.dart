import 'package:dbs_care/config/app_asset.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/feature/public/widget/button.dart';
import 'package:dbs_care/feature/public/widget/card_harga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 160, padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(color: redColor, borderRadius: const BorderRadius.only(bottomRight:  Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 70),
                  Text('Selamat Datang,',
                  style: whiteTextStyle.copyWith(fontWeight: bold, color: whiteColor, fontSize: 24),
                  ),
                  Text('Di Aplikasi DBS Care',
                  style: whiteTextStyle.copyWith(fontWeight: regular, color: whiteColor, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Promo berlangsung :',
              style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                  AppAsset.promo1, 
                  width: double.infinity,
                ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/promo');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Lihat semua promo',
                  style: blackTextStyle.copyWith(fontWeight: regular, color: blueColor, fontSize: 13),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 10,
              color: whiteColor,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Harga Terkini :',
              style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ),
             SizedBox(
               height: 70,
               child: ListView(
                 scrollDirection: Axis.horizontal,
                 children:  [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                    ),
                    const CardHarga(),
                    const CardHarga(),
                    const CardHarga(),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                    ),
                 ],
               ),
             ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/daftarharga');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Lihat semua daftar harga',
                  style: blackTextStyle.copyWith(fontWeight: regular, color: blueColor, fontSize: 13),
                ),
              ),
            ),
            Container(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text('Login untuk mendapatkan fitur lainnya',
                style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ButtonPrimary(name: 'Login', onTap: () => login(),),
            ),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text('By',
                style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Image.asset(
                    AppAsset.logoDbs, 
                    height: 30,
                  ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

void login() {
  Get.toNamed('/login');

}