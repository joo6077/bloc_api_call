import 'dart:convert';

class JRadioType {
  final String name;
  final bool isSelected;
  JRadioType({
    required this.name,
    required this.isSelected,
  });

  JRadioType copyWith({
    String? name,
    bool? isSelected,
  }) {
    return JRadioType(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
    };
  }

  factory JRadioType.fromMap(Map<String, dynamic> map) {
    return JRadioType(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory JRadioType.fromJson(String source) =>
      JRadioType.fromMap(json.decode(source));

  @override
  String toString() => 'JRadioType(name: $name, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JRadioType &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}

typedef JRadioOnChange = Function(JRadioType);
