// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, avoid_print, unnecessary_null_comparison

import 'package:dbs_care/config/app_format.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/core/domain/api_url.dart';
import 'package:dbs_care/feature/public/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dbs_care/feature/public/widget/button.dart';
import 'package:image_network/image_network.dart';

import '../../../public/controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 65, bottom: 25),
            decoration: BoxDecoration(
                color: redColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              children: [
                ImageNetwork(
                  image: '$urlImage${profileController.photo}',
                  height: 150,
                  width: 150,
                  duration: 1000,
                  curve: Curves.easeIn,
                  onPointer: true,
                  debugPrint: false,
                  fullScreen: false,
                  fitAndroidIos: BoxFit.cover,
                  fitWeb: BoxFitWeb.cover,
                  borderRadius: BorderRadius.circular(250),
                  onLoading: CircularProgressIndicator(
                    color: greyColor,
                  ),
                  onError: Icon(
                    Icons.error,
                    color: redColor,
                  ),
                ),
                Center(
                    child: Text(
                  // profileController.nama,
                  'Nama',
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                )),
                Container(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                DisplayField(
                  label: 'Customer ID',
                  hintText: profileController.custId,
                ),
                DisplayField(
                  label: 'Nomor Handphone',
                  hintText: profileController.hpNo,
                ),
                DisplayField(
                  label: 'NIK',
                  hintText: profileController.ktpNo,
                ),
                if (profileController.tglLahir != '')
                  DisplayField(
                    label: 'Tanggal Lahir',
                    hintText: AppFormat.date(profileController.tglLahir),
                  )
                else
                  const DisplayField(
                    label: 'Tanggal Lahir',
                    hintText: 'Belum diset.',
                  ),
                // const DisplayField(
                //   hintText: 'Alamat :',
                // ),
                Container(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
          ),
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
    });
  }
}
