import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/crypto_coin/widgets/navigation_bar.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins_get_function.dart';

class ConvertationScreen extends StatefulWidget {
  const ConvertationScreen({super.key});
  @override
  State<ConvertationScreen> createState() => _ConvertationScreenState();
}

class _ConvertationScreenState extends State<ConvertationScreen> {
  late List<CryptoCoin> initialList;
  Future<List<CryptoCoin>> initialListFunction = getCoinsList();
  bool isOpen = false;
  @override
  void didChangeDependencies() {
    late List<CryptoCoin> cryptoList;
    Future<List<CryptoCoin>> loadCryptoListFunction = getCoinsList();
    setState(() {
      loadCryptoListFunction.then((value) => {cryptoList = value});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppNavigationBar(
        pageIndex: 1,
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Convertation Crypto",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Container(),
    );
  }
}
