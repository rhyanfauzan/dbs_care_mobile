// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/app_format.dart';
import '../../../config/theme.dart';

class CardPromo extends StatelessWidget {
  CardPromo(
      {super.key,
      required this.image,
      required this.urlPromo,
      this.periode = 'Periode tidak ditentukan'});

  final String image;
  final String urlPromo;
  final String periode;
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
    return GestureDetector(
      onTap: () {
        _launched = _launchInBrowser(Uri(scheme: 'https', host: urlPromo));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Stack(
          children: [
            ImageNetwork(
              image: image,
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
                    scheme: 'https', host: AppFormat().removeHttps(urlPromo)));
              },
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    periode,
                    style: whiteTextStyle.copyWith(fontSize: 11, fontWeight: medium),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
