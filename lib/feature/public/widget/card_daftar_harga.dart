import 'package:dbs_care/config/app_asset.dart';
import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';

class CardDaftarHarga extends StatelessWidget {
  const CardDaftarHarga({
    super.key,
    required this.name,
    required this.model,
    required this.price,
    this.discount = '',
  });

  final String name;
  final String model;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
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
              width: 80,
            ),
          ),
          Container(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: blackTextStyle.copyWith(
                          fontWeight: bold, fontSize: 13),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          color: darkBackgroundColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        model,
                        style: whiteTextStyle.copyWith(
                            fontWeight: light, fontSize: 11),
                      ),
                    )
                  ],
                ),
                    Container(
                      height: 4,
                    ),
                Text(
                  'Harga: $price',
                  style:
                      blackTextStyle.copyWith(fontWeight: regular, fontSize: 12),
                ),
                Text(
                  'Diskon! $discount',
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 12, color: redColor),
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
