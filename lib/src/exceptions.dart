/// An exception triggered by the package in case of error
class GYWException implements Exception {
  /// The description of the cause of the error
  final String cause;

  const GYWException(this.cause);

  @override
  String toString() {
    // All subtypes are defined in the library, the call is therefore safe
    // ignore: no_runtimetype_tostring
    return "$runtimeType: $cause";
  }
}

/// This exception is triggered when a method is called when it should not.
///
/// It is triggered when an action is made on a component while it is not ready
/// or when another operation is already in progess.
/// For example, trying to connect a device while a connection is already
/// in progress
class GYWStatusException extends GYWException {
  const GYWStatusException(super.cause);
}
