extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension TimeToFormat on String {
  String timeFormat() {
    var parts = split('T');
    return parts[0].trim();
  }
}
