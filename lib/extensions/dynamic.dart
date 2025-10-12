extension DynamicExtensions on dynamic {
  T? get<T>([T? defaultValue]) {
    if (this is T) {
      return this;
    }
    return defaultValue;
  }
}
