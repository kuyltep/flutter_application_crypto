import '../features/convertation/convertation_screen.dart';
import '../features/crypto_coin/crypto_coin.dart';
import '../features/crypto_list/crypto_list.dart';

final routes = {
  "/": (context) => const CryptoListScreen(title: "Crypto List"),
  "/coin": (context) => const CryptoCoinScreen(),
  "/convertation": (context) => const ConvertationScreen(),
};
