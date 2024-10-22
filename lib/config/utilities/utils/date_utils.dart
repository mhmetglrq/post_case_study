import 'package:intl/intl.dart';

class DateFormatUtils {
  DateFormatUtils._();
  static String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return "Unknown date";
    }
    try {
      DateTime parsedDate = DateFormat("dd/MM/yyyy HH:mm:ss").parse(dateString);
      return DateFormat("MMM dd").format(parsedDate);
    } catch (e) {
      return "Invalid date";
    }
  }

  static String calculateReadingTime(String text) {
    const int averageWordsPerMinute = 40;
    int wordCount = text.split(RegExp(r'\s+')).length;
    double readingTime = wordCount / averageWordsPerMinute;
    int minutes = readingTime.ceil();
    return "$minutes min read";
  }
}
