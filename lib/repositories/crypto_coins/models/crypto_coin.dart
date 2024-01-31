import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl,
    required this.symbol,
    required this.high24Hour,
    required this.low24Hour,
    required this.lowHour,
    required this.highHour,
  });
  final String name;
  final double priceInUSD;
  final String imageUrl;
  final String symbol;
  final double low24Hour;
  final double high24Hour;
  final double lowHour;
  final double highHour;

  @override
  // TODO: implement props
  List<Object?> get props => [name, priceInUSD, imageUrl];
}
