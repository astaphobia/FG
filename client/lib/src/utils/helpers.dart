class Validation {
  bool email(String str) {
    Pattern pattern = r'^([a-zA-Z0-9\_\-\.]+)@(([a-zA-Z0-9\-]+\.)+)([a-zA-Z]{2,3})';
    RegExp rgx = RegExp(pattern);
    return rgx.hasMatch(str);
  }
}