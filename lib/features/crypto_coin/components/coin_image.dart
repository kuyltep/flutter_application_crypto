import 'package:flutter/widgets.dart';

class CoinImageSection extends StatelessWidget {
  const CoinImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(200, 29, 32, 41),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 200,
      height: 200,
      child: Image.network(image, width: 230, height: 230),
    );
  }
}
