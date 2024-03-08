// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dbs_care/core/domain/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/models/home_model.dart';

class HomeController extends GetxController {
  var models = <Model>[].obs;
  RxBool showBannerPromo = false.obs;
  var bannerPromo = ''.obs;
  var urlPromo = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/home'),
        headers: {
          'Accept': 'application/json',
          'X-CSRF-TOKEN': '',
        },
      );

      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(jsonResponse);
        
        // Set banner promo and URL promo
        bannerPromo.value = homeModel.data.promos.photo;
        urlPromo.value = homeModel.data.promos.addressLink;

        // Set models
        models.assignAll(homeModel.data.models);
        showBannerPromo.value = true;
      } else {
        print('Failed to load data: ${response.reasonPhrase}');
        showBannerPromo.value = false;
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
