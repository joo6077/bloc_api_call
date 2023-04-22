import 'package:bloc_api_call/application/enums/card_enum.dart';

class NumberHistory {
  final CardEnum cardEnum;
  final int lastListNumber;
  final int lastAdsNumber;

  NumberHistory({
    required this.cardEnum,
    required this.lastListNumber,
    required this.lastAdsNumber,
  });

  NumberHistory copyWith({
    CardEnum? cardEnum,
    int? lastListNumber,
    int? lastAdsNumber,
  }) {
    return NumberHistory(
      cardEnum: cardEnum ?? this.cardEnum,
      lastListNumber: lastListNumber ?? this.lastListNumber,
      lastAdsNumber: lastAdsNumber ?? this.lastAdsNumber,
    );
  }

  @override
  String toString() =>
      'NumberHistory(cardEnum: $cardEnum, lastListNumber: $lastListNumber, lastAdsNumber: $lastAdsNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NumberHistory &&
        other.cardEnum == cardEnum &&
        other.lastListNumber == lastListNumber &&
        other.lastAdsNumber == lastAdsNumber;
  }

  @override
  int get hashCode =>
      cardEnum.hashCode ^ lastListNumber.hashCode ^ lastAdsNumber.hashCode;
}
