enum OrderEnum {
  asc,
  desc,
}

extension OrderEnumExtension on OrderEnum {
  String get value {
    switch (this) {
      case OrderEnum.asc:
        return 'asc';
      case OrderEnum.desc:
        return 'desc';
    }
  }
}
