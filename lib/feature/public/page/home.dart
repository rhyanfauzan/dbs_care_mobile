// ignore_for_file: must_be_immutable, unused_field

import 'package:dbs_care/config/app_asset.dart';
import 'package:dbs_care/config/app_format.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/feature/public/widget/button.dart';
import 'package:dbs_care/feature/public/widget/card_harga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_network/image_network.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController());

  final String token = GetStorage().read('token') ?? '';
  final String nama = GetStorage().read('nama') ?? '';
  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBackgroundColor,
        body: SingleChildScrollView(
          child: GetBuilder<HomeController>(
              init: homeController,
              builder: (hc) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(50))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 60),
                          if (token.isNotEmpty || token != '')
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Halo, $nama',
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: bold,
                                      color: whiteColor,
                                      fontSize: 20),
                                ),
                                Text(
                                  'Selamat Datang Di Aplikasi DBS Care',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: regular,
                                    color: whiteColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat Datang,',
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: bold,
                                      color: whiteColor,
                                      fontSize: 20),
                                ),
                                Text(
                                  'Di Aplikasi DBS Care',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: regular,
                                    color: whiteColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          Container(height: 20),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Promo Terbaru',
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/promo');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Lihat Semua',
                                style: blackTextStyle.copyWith(
                                    fontWeight: regular, fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(() {
                        if (homeController.showBannerPromo.value == true) {
                          return SizedBox(
                            width: double.infinity,
                            child: ImageNetwork(
                              image: homeController.bannerPromo.value,
                              height: 150,
                              width: double.maxFinite,
                              duration: 1000,
                              curve: Curves.easeIn,
                              onPointer: true,
                              debugPrint: false,
                              fullScreen: true,
                              fitAndroidIos: BoxFit.cover,
                              fitWeb: BoxFitWeb.cover,
                              onLoading: CircularProgressIndicator(
                                color: greyColor,
                              ),
                              onError: Icon(
                                Icons.error,
                                color: redColor,
                              ),
                              onTap: () {
                                _launched = _launchInBrowser(Uri(
                                    scheme: 'https',
                                    host: AppFormat().removeHttps(
                                        homeController.urlPromo.value)));
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: redColor,
                            ),
                          );
                        }
                      }),
                    ),
                    Container(
                      width: double.infinity,
                      height: 10,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga Terkini',
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/daftarharga');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Lihat Semua',
                                style: blackTextStyle.copyWith(
                                    fontWeight: regular, fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 95,
                        child: Obx(() {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: hc.models.length,
                            itemBuilder: (context, index) {
                              // Build each list item based on the data in the controller
                              return CardHarga(
                                model: hc.models[index].model,
                                type: hc.models[index].type,
                                harga:
                                    AppFormat.currency(hc.models[index].price),
                                diskon: AppFormat.currency(
                                    hc.models[index].discount),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Sekilas Tentang DBS Care Mobile',
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    color: redColor,
                                    fontWeight: semiBold,
                                    fontSize: 14),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'DBS Care Mobile adalah sebuah aplikasi yang memberikan informasi seputar layanan / service mobil Toyota, info harga terbaru, pemberitahuan promo menarik, dan fitur lainnya.',
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontWeight: regular, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (token.isEmpty || token == '')
                      Column(
                        children: [
                          Container(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                'Login untuk mendapatkan fitur lainnya',
                                style: blackTextStyle.copyWith(
                                    fontWeight: semiBold, fontSize: 14),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ButtonPrimary(
                              name: 'Login',
                              onTap: () => login(),
                            ),
                          ),
                        ],
                      ),
                    Container(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'By',
                          style: blackTextStyle.copyWith(
                              fontWeight: regular, fontSize: 12),
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
                    Container(
                      height: 50,
                    )
                  ],
                );
              }),
        ));
  }
}

void login() {
  Get.toNamed('/login');
}
