mixin IdSupport<T> {
  String getId();

  @override
  bool operator ==(Object other) => other is T && other is IdSupport && other.getId() == getId();

  @override
  int get hashCode => getId().hashCode;
}
