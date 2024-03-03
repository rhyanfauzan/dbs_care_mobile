import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';

class CardDaftarHarga extends StatelessWidget {
  const CardDaftarHarga({super.key,
  required this.name,
  required this.price
  });

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),),
          Container(height: 4,),
          Text(price, style: greyTextStyle.copyWith(fontWeight: light, fontSize: 11),)
        ],
      ),
    );
  }
}