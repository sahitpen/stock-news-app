import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final String date;
  final double price;

  const Price({
    this.date,
    this.price,
  });

  @override
  List<Object> get props => [
        date,
        price,
      ];

  @override
  bool get stringify => true;

  static Price fromJson(String dateKey, dynamic json) {
    return Price(
      date: dateKey,
      price: double.parse(json['4. close']),
    );
  }
}
