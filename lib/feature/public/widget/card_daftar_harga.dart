import 'package:dbs_care/config/app_asset.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';

class CardDaftarHarga extends StatelessWidget {
  const CardDaftarHarga({
    super.key,
    required this.name,
    required this.price,
    this.discount = '',
  });

  final String name;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              AppAsset.icCar,
              width: 27,
            ),
          ),
          Container(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 12),
                  overflow: TextOverflow.visible,
                  maxLines: 1,
                ),
                Container(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: blackTextStyle.copyWith(
                          fontWeight: medium, fontSize: 12),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Diskon $discount',
                        style: whiteTextStyle.copyWith(
                            fontWeight: light, fontSize: 11),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
