/// The default parameters of the screen of the aRdent device
enum GYWScreenParameters {
  /// Supported Width of a GYW aRdent device
  width(854),

  /// Supported Width of a GYW aRdent device
  height(480);

  /// Value associated to the property
  final num value;

  const GYWScreenParameters(this.value);
}
