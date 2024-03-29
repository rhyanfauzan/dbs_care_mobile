// ignore_for_file: must_be_immutable

import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String name;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: redColor, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Center(
          child: (Text(
            name.toUpperCase(),
            style: whiteTextStyle.copyWith(fontWeight: medium),
          )),
        ),
      ),
    );
  }
}

class ButtonSecondary extends StatelessWidget {
  ButtonSecondary({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  void Function()? onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: darkGreyColor, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Center(
          child: (Text(
            name.toUpperCase(),
            style: whiteTextStyle.copyWith(fontWeight: medium),
          )),
        ),
      ),
    );
  }
}
