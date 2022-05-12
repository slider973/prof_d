import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class DateParser {
  DateParser._() {
    initializeDateFormatting();
  }

  static final instance = DateParser._();

  String convertUTCToLocal(DateTime date) {
    return DateFormat.yMMMd().add_jm().format(date);
  }

  String convertHourUTCToFrLocal(DateTime date) {
    return DateFormat("HH:mm", "fr_FR").format(date);
  }

  String convertDayUTCToFrLocal(DateTime date) {
    return DateFormat("yMMMMEEEEd", 'fr_FR').format(date);
  }

  String convertEpochToLocal(int date) {
    return DateFormat.yMMMd().add_jm().format(
      DateTime.fromMillisecondsSinceEpoch(date).toLocal(),
    );
  }

  DateTime convertEpochToLocalDate(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date).toLocal();
  }

  int convertDateToUTCEpoch(DateTime date) {
    return date.toUtc().millisecondsSinceEpoch;
  }
}
