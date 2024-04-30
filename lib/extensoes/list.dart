extension ListUtils<T> on List<T> {
  num sum(num Function(T element) f) {
    num sum = 0;
    for (var item in this) {
      sum += f(item);
    }
    return sum;
  }
}

extension IterableExtension<T> on Iterable<T> {
  Iterable<T> distinct(Object Function(T e) getCompareValue) {
    var result = <T>[];
    for (dynamic element in this) {
      if (!result.any((x) => getCompareValue(x) == getCompareValue(element))) {
        result.add(element);
      }
    }

    return result;
  }
}
