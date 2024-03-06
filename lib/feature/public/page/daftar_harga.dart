import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/feature/public/widget/card_daftar_harga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_format.dart';
import '../controller/model_controller.dart';

class DaftarHargaPage extends StatelessWidget {
  DaftarHargaPage({super.key});

  final modelController = Get.put(ModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Harga',
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
        body: GetBuilder<ModelController>(
            init: modelController,
            builder: (hc) {
              return Obx(() {
                if (hc.isLoading.isTrue) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: redColor,
                  ));
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    itemCount: hc.models.length,
                    itemBuilder: (context, index) {
                      // Build each list item based on the data in the controller
                      return CardDaftarHarga(
                        name: hc.models[index].type ?? '',
                        price: AppFormat.currency(hc.models[index].price ?? ''),
                      );
                    },
                  );
                }
              });
            }));
  }
}
