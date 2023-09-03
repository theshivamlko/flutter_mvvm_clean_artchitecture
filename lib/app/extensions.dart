extension NotNullString on String? {
  String orEmpty() {
    return this == null ? "" : this!;
  }
}

extension NotNullInt on int? {
  int orZero() {
    return this == null ? 0 : this!;
  }
}
