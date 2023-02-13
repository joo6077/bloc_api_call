class JOptionType<T> {
  final String name;
  final bool isSelected;
  final T value;

  JOptionType({
    required this.name,
    required this.isSelected,
    required this.value,
  });

  JOptionType<T> copyWith({
    String? name,
    bool? isSelected,
  }) {
    return JOptionType<T>(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      value: value ?? this.value,
    );
  }

  @override
  String toString() =>
      'JRadioType(name: $name, isSelected: $isSelected, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JOptionType &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}

typedef JOnChange<T> = Function(JOptionType<T>);
