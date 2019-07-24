class InvalidTypeException implements Exception {
  String cause = "invalid type";

  InvalidTypeException(this.cause);
}

class InvalidInputTypeException implements Exception {
  String cause = "invalid input type";

  InvalidInputTypeException(this.cause);
}
