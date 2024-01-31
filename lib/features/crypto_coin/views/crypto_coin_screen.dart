import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bar_chart/bar_chart_widget.dart';
import 'package:flutter_application_1/features/crypto_coin/components/coin_image.dart';
import 'package:flutter_application_1/features/crypto_coin/components/long_information_section.dart';
import 'package:flutter_application_1/features/crypto_coin/components/navigation_button.dart';
import 'package:flutter_application_1/features/crypto_coin/components/price_chart.dart';
import 'package:flutter_application_1/features/crypto_coin/components/small_information_section.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins.dart';

import '../../../repositories/crypto_coins/crypto_coins_get_function.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;
  late List<CryptoCoin> cryptoList;
  Future<List<CryptoCoin>> loadCryptoListFunction = getCoinsList();
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is CryptoCoin, "You must provide string args");
    coin = args as CryptoCoin;
    setState(() {
      loadCryptoListFunction.then((value) => {cryptoList = value});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(coin!.name ?? "...",
              style: Theme.of(context).textTheme.titleMedium),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Scrollbar(
            child: ListView(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
            child: Center(
                child: Column(
              children: [
                Center(child: CoinImageSection(image: coin!.imageUrl)),
                Center(
                    child: CoinSmallInformationSection(
                        title: "Name: ", value: coin!.name)),
                Center(
                    child: CoinLongInformationSection(
                        title: "Current price: ", value: coin!.priceInUSD)),
                Center(
                    child: CoinLongInformationSection(
                        title: "High 24 hours: ", value: coin!.high24Hour)),
                Center(
                    child: CoinLongInformationSection(
                        title: "Low 24 hours: ", value: coin!.low24Hour)),
                Center(
                    child: CoinLongInformationSection(
                        title: "High hour: ", value: coin!.highHour)),
                Center(
                  child: CoinLongInformationSection(
                      title: "Low hour: ", value: coin!.lowHour),
                ),
                Center(
                    child: CoinPriceChart(
                        priceInUSD: coin!.priceInUSD,
                        highValue: coin!.highHour,
                        lowValue: coin!.lowHour,
                        title: "1 Hour price chart")),
                Center(
                    child: CoinPriceChart(
                        priceInUSD: coin!.priceInUSD,
                        highValue: coin!.high24Hour,
                        lowValue: coin!.low24Hour,
                        title: "24 Hours price chart")),
                const Center(
                    child: CoinScreenNavigationButton(
                  buttonRoute: "/convertation",
                  buttonText: "Convertation...",
                ))
              ],
            )),
          )
        ])));
  }
}
