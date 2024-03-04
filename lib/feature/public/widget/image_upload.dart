// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadController extends GetxController {
  final _image = Rxn<File>();

  File? get image => _image.value;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  void uploadImage() {
    // Handle upload action
    print(_image.value);
  }
}

class ImageUploadField extends StatelessWidget {
  final ImageUploadController controller;

  const ImageUploadField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.pickImage,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Obx(() {
          final image = controller.image;
          if (image != null) {
            return Image.file(image, fit: BoxFit.cover);
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, size: 50),
                Text('Profile Picture', style: TextStyle(fontSize: 11)),
              ],
            );
          }
        }),
      ),
    );
  }
}

// Usage
class YourWidget extends StatelessWidget {
  final ImageUploadController controller = Get.put(ImageUploadController());

  @override
  Widget build(BuildContext context) {
    return ImageUploadField(controller: controller);
  }
}
