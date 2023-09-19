class FirmwareVersion implements Comparable<FirmwareVersion> {
  final int major;
  final int minor;
  final int patch;

  FirmwareVersion(
    this.major,
    this.minor,
    this.patch,
  );

  @override
  int compareTo(FirmwareVersion other) {
    if (major == other.major) {
      if (minor == other.minor) {
        return patch.compareTo(other.patch);
      }
      return minor.compareTo(other.minor);
    }
    return major.compareTo(other.major);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FirmwareVersion &&
          runtimeType == other.runtimeType &&
          major == other.major &&
          minor == other.minor &&
          patch == other.patch;

  @override
  int get hashCode => major.hashCode ^ minor.hashCode ^ patch.hashCode;

  @override
  String toString() => "$major.$minor.$patch";
}
