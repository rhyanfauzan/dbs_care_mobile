import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';

class CardHarga extends StatelessWidget {
  const CardHarga({super.key, this.model = '', this.harga = ''});

  final String model;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Column(
        children: [
          Text(
           model,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
          ),
          Container(
            height: 4,
          ),
          Text(
           harga,
            style: greyTextStyle.copyWith(fontWeight: light, fontSize: 11),
          )
        ],
      ),
    );
  }
}
