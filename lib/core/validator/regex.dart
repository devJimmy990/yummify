class Regex {
  static bool matchEmail(String value) =>
      RegExp(r"^[a-zA-Z0-9_-.]+@([a-zA-Z]+\.)+[a-zA-Z]{2,}$").hasMatch(value);
}
