import 'package:intl/intl.dart';

class AppFormat {
  static String date(String stringDate) {
    // 2022-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat.yMMMMd().format(dateTime); // 5 Feb 2022
  }

  static String formatdate(String stringDate) {
    // 2022-02-05 00:00:00
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('yyyy-MM-dd').format(dateTime); // 2022-02-05
  }

  static String currency(String number) {
    return NumberFormat.currency(
      decimalDigits: 2,
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(double.parse(number));
  }

  String removeHttps(String url) {
    // Parse the URL string
    Uri uri = Uri.parse(url);

    // Check if the scheme is 'https' and remove it
    if (uri.scheme == 'https') {
      return uri.host; // Return only the host part of the URL
    }

    // If the scheme is not 'https', return the original URL
    return url;
  }

  String convertDateFormat(String dateString) {
    // Parse the date string into a DateTime object
    DateTime dateTime = DateFormat('dd-MM-yyyy').parse(dateString);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    return formattedDate;
  }
}
