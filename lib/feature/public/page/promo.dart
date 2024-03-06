import 'package:dbs_care/config/app_format.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/feature/public/controller/promo_controller.dart';
import 'package:dbs_care/feature/public/widget/card_promo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoPage extends StatelessWidget {
  PromoPage({super.key});

  final promoController = Get.put(PromoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Promo',
            style: whiteTextStyle, // Set text color to white
          ),
          backgroundColor: redColor, // Set background color to red
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: whiteColor, // Set icon color to white
          ),
        ),
        body: Obx(() {
          if (promoController.isLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              itemCount: promoController.promos.length,
              itemBuilder: (context, index) {
                return CardPromo(
                  urlPromo: AppFormat()
                      .removeHttps(promoController.promos[index].addressLink),
                  image: promoController.promos[index].photo,
                  periode: promoController.promos[index].promoPeriode,
                );
              },
            );
          }
        }));
  }
}
