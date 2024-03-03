import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/feature/public/widget/card_promo.dart';
import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Promo',
            style: whiteTextStyle, // Set text color to white
          ),
          backgroundColor: redColor, // Set background color to red
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: whiteColor, // Set icon color to white
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              CardPromo(
                urlPromo: 'www.man.duniabarusa.id',
                image: 'Ada',
                periode: '1 Januari 2024 - 30 Januari 2024',
              ),
              CardPromo(
                urlPromo: 'www.openai.com',
                image: 'Ada',
              ),
              CardPromo(
                urlPromo: 'www.google.com',
                image: 'Ada',
                periode: '1 Desember 2023 - 30 Desember 2023',
              ),
              CardPromo(
                urlPromo: 'www.openai.me',
                image: 'Ada',
              ),
              CardPromo(
                urlPromo: 'www.openai.me',
                image: 'Ada',
              ),
              CardPromo(
                urlPromo: 'www.openai.me',
                image: 'Ada',
              ),
            ],
          ),
        ));
  }
}
