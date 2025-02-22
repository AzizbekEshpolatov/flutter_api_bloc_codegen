import 'dart:math';

class AppConstants {
  static double calculateDiscount(double price, double discountPercentage) {
    return price * (1 - discountPercentage / 100);
  }

  static String formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return "$day-$month-${date.year}";
  }

  static int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }
}
