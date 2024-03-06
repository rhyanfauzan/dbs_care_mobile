// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dbs_care/core/domain/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/models/model_model.dart';

class ModelController extends GetxController {
  var models = <DataModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/master-models'),
        headers: {
          'accept': 'application/json',
          'X-CSRF-TOKEN': '',
        },
      );

      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final modelModel = ModelModel.fromJson(jsonResponse);

        // Set models
        models.assignAll(modelModel.data);
        isLoading.value = false;
      } else {
        print('Failed to load data: ${response.reasonPhrase}');
        isLoading.value = false;
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
