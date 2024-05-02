extension DateTimeX on DateTime {
  String toDateId() => '$year-$month-$day';

  static DateTime fromId(String dateId) {
    final parts = dateId.split('-');
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }
}
