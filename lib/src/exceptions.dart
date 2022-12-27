/// This type of exception is triggered by this package in case of error
class GYWException implements Exception {
  /// String describing the cause of the error
  final String cause;

  const GYWException(this.cause);

  @override
  String toString() {
    return "$runtimeType: $cause";
  }
}

/// This type of exception is triggered when a method is triggered while an
/// action is made on a component of this package while it should not.
/// For example, trying to connect a device while a connection is already
/// in progress
class GYWStatusException extends GYWException {
  const GYWStatusException(super.cause);
}
