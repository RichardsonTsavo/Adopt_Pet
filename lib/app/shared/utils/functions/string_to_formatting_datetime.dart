export 'string_to_formatting_datetime.dart';

DateTime stringToFormattingDateTime({
  required String date,
}) {
  List info = [];
  info = date.split("/");
  String year = info[2];
  String month = info[1];
  String day = info[0];
  return DateTime(int.parse(year), int.parse(month), int.parse(day));
}
