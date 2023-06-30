mixin IdSupportV2<T> {
  String getId();
  @override
  bool operator ==(dynamic other) => other is T && other is IdSupportV2 && other.getId() == getId();
  @override
  int get hashCode => getId().hashCode;
}
