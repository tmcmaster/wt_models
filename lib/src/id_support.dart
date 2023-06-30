mixin IdSupport<T> {
  String getId();

  @override
  bool operator ==(dynamic other) => other is T && other is IdSupport && other.getId() == getId();

  @override
  int get hashCode => getId().hashCode;
}
