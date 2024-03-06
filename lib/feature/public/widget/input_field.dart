// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:dbs_care/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    this.hintText = '',
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class DateField extends StatelessWidget {
  const DateField(
      {super.key, required this.controller, this.hintText = 'Tanggal'});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true, // Make the text field read-only
      onTap: () async {
        // Show date picker when the text field is tapped
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDatePickerMode: DatePickerMode.day,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        // Update the text field with the selected date
        if (pickedDate != null) {
          // Format the selected date as "dd-MM-yyyy"
          final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          controller.text = formattedDate; // Set formatted date to text field
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: whiteColor,
        suffixIcon: const Icon(
          Icons.calendar_today,
          size: 15,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: 16), // Add content padding
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordField({required this.controller, this.hintText = 'Password'});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            size: 18,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        filled: true,
        fillColor: whiteColor,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}

class NumericField extends StatelessWidget {
  const NumericField({
    Key? key,
    required this.controller,
    this.hintText = '',
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}


class DisplayField extends StatelessWidget {
  const DisplayField({
    Key? key,
    this.hintText = '',
    this.label = '',
  }) : super(key: key);

  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),),
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            enabled: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}