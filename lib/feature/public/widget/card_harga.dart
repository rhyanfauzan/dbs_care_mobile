import 'package:dbs_care/config/app_asset.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';

class CardHarga extends StatelessWidget {
  const CardHarga(
      {super.key,
      this.model = '',
      this.type = '',
      this.harga = '',
      this.diskon = ''});

  final String model;
  final String type;
  final String harga;
  final String diskon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.logoToyota,
                width: 20,
              ),
              Container(
                width: 6,
              ),
              Text(
                model,
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Container(
            height: 8,
          ),
          Text(
            harga,
            style: blackTextStyle.copyWith(fontWeight: light, fontSize: 12),
          ),
          Text(
            'Diskon! $diskon',
            style: blackTextStyle.copyWith(fontWeight: light, fontSize: 11, color: redColor),
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          //   decoration: BoxDecoration(
          //       color: redColor, borderRadius: BorderRadius.circular(5)),
          //   child: Text(
          //     'Diskon $diskon',
          //     style: whiteTextStyle.copyWith(fontWeight: regular, fontSize: 11),
          //   ),
          // )
        ],
      ),
    );
  }
}
