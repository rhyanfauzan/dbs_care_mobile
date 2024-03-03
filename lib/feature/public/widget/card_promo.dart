// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/app_asset.dart';
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
        _launched = _launchInBrowser(
            Uri(scheme: 'https', host: urlPromo));
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: whiteColor,
        ),
        child: Stack(
          children: [
            Image.asset(AppAsset.promo1),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: redColor,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(15))),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    periode,
                    style: whiteTextStyle.copyWith(fontSize: 11),
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
