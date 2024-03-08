// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors, avoid_print

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
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Center(
                child: Text(
              'Profile',
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            )),
          ),
          Container(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                Container(
                  height: 20,
                ),
                DisplayField(
                  label: 'Customer ID',
                  hintText: profileController.custId,
                ),
                DisplayField(
                  label: 'Nama',
                  hintText: profileController.nama,
                ),
                DisplayField(
                  label: 'Nomor Handphone',
                  hintText: profileController.hpNo,
                ),
                DisplayField(
                  label: 'NIK',
                  hintText: profileController.ktpNo,
                ),
                DisplayField(
                  label: 'Tanggal Lahir',
                  hintText: AppFormat.date(profileController.tglLahir),
                ),
                //  DisplayField(hintText: 'Alamat :',),
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
