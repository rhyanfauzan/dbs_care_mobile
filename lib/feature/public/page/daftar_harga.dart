import 'package:dbs_care/config/theme.dart';
import 'package:dbs_care/feature/public/widget/card_daftar_harga.dart';
import 'package:dbs_care/feature/public/widget/card_promo.dart';
import 'package:flutter/material.dart';

class DaftarHargaPage extends StatelessWidget {
  const DaftarHargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Daftar Harga',
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 20,
                ),
                const CardDaftarHarga(name: 'Veloz 1.5 A/T', price: 'Rp. 255.000.000'),
                const CardDaftarHarga(name: 'Avanza 1.5 A/T', price: 'Rp. 235.000.000'),
                const CardDaftarHarga(name: 'Innova 2.5 G M/T', price: 'Rp. 515.000.000'),
                const CardDaftarHarga(name: 'Velfire 2.5 A/T', price: 'Rp. 935.000.000'),
              ],
            ),
          ),
        ));
  }
}
