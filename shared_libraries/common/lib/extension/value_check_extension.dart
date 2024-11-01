extension ValueCheckExtension on dynamic {
  isNull() => this == null;
  isNotNull() => this != null;
}
