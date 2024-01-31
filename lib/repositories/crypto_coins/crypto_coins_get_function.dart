import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';

Future<List<CryptoCoin>> getCoinsList() async {
  final response = await Dio().get(
      "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,DOG,TRX,LTC,USDT,SOL,XRP,ADA,DAI,BCH,USDC,DOT,ICP&tsyms=USD");
  final data = response.data as Map<String, dynamic>;
  final dataRaw = data["RAW"] as Map<String, dynamic>;
  final cryptoCoinsList = dataRaw.entries.map((e) {
    final usdData =
        (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
    final price = usdData["PRICE"];
    final imageUrl = usdData["IMAGEURL"];
    final symbol = usdData["FROMSYMBOL"];
    final low24Hour = usdData["LOW24HOUR"];
    final high24Hour = usdData["HIGH24HOUR"];
    final lowHour = usdData["LOWHOUR"];
    final highHour = usdData["HIGHHOUR"];
    return CryptoCoin(
        name: e.key,
        symbol: symbol,
        priceInUSD: price,
        low24Hour: low24Hour,
        high24Hour: high24Hour,
        lowHour: lowHour,
        highHour: highHour,
        imageUrl: "https://www.cryptocompare.com/$imageUrl");
  }).toList();
  return cryptoCoinsList;
}
