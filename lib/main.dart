import 'package:flutter/material.dart';
import 'package:flutter_application_1/crypto_coins_list.dart';
import 'package:get_it/get_it.dart';

import 'repositories/crypto_coins/crypto_coins.dart';

void main() {
  GetIt.I.registerSingleton<AbstractCoinsRepository>(CryptoCoinsRepository());
  runApp(const CryptoCoinsList());
}
