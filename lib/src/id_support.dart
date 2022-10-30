abstract class IdSupport<T> {
  String getId();

  @override
  bool operator ==(dynamic other) => (other is T && (other as IdSupport).getId() == getId());

  @override
  int get hashCode => getId().hashCode;
}
