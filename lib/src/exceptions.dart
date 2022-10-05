class GYWException implements Exception {
  final String cause;

  const GYWException(this.cause);
}

class GYWStatusException extends GYWException {
  const GYWStatusException(super.cause);
}
