extension StringExtension on String {
  String get _upperFirstLetter => replaceFirst(this[0], this[0].toUpperCase());
  String get fireErrorLocal => replaceAll('-', ' ')._upperFirstLetter;
}
