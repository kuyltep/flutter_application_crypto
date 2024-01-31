import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/crypto_coin/widgets/navigation_bar.dart';
import 'package:flutter_application_1/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter_application_1/features/widgets/widgets.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins_get_function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin> searchedList = [];
  late List<CryptoCoin> initialList;
  Future<List<CryptoCoin>> initialListFunction = getCoinsList();
  bool isOpen = false;
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());
  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        setState(() {
          searchedList = [];
          for (int i = 0; i < initialList.length; i++) {
            final CryptoCoin coin = initialList[i];
            final String coinName = coin.name;
            if (coinName.contains(s.toUpperCase()) ||
                coinName.contains(s.toLowerCase())) {
              searchedList.add(coin);
            }
          }
        });
      },
      autofocus: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white, fontSize: 18),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search...',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        bottomNavigationBar: const AppNavigationBar(
          pageIndex: 0,
        ),
        appBar: AppBar(
            // TRY THIS: Try changing the color here to a specific color (to
            // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
            // change color while the other colors stay the same.
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            leading: SvgPicture.asset(
              "assets/svg/logo.svg",
              width: 30,
              height: 30,
            ),
            title: !isOpen
                ? Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : _searchTextField(),
            actions: [
              !isOpen
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isOpen = true;
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      tooltip: "Search",
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isOpen = false;
                        });
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
            ],
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor),
        body: RefreshIndicator(
          color: Colors.yellow.shade600,
          backgroundColor: Colors.grey.shade800,
          onRefresh: () async {
            _cryptoListBloc.add(LoadCryptoList());
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  initialListFunction.then((value) {
                    initialList = value;
                  });
                  return Container(
                      margin:
                          const EdgeInsetsDirectional.only(top: 8, bottom: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Color.fromARGB(200, 29, 32, 41),
                      ),
                      child: !isOpen
                          ? ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                    color: Theme.of(context).dividerColor,
                                  ),
                              itemCount: state.coinList.length,
                              itemBuilder: (context, index) {
                                final coin = state.coinList[index];
                                return CryptoCoinTile(coin: coin);
                              })
                          : ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                    color: Theme.of(context).dividerColor,
                                  ),
                              itemCount: searchedList.length,
                              itemBuilder: (context, index) {
                                final coin = searchedList[index];
                                return CryptoCoinTile(coin: coin);
                              }));
                }
                if (state is CryptoListLoadingFailure) {
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Something wrong went"),
                          Text(
                            "Please try again later",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                              onPressed: () {
                                _cryptoListBloc.add(LoadCryptoList());
                              },
                              child: Text(
                                "Try again",
                                style: TextStyle(color: Colors.yellow.shade600),
                              )),
                        ]),
                  );
                }
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.yellow.shade700,
                ));
              }),
        )

        //   child: (_cryptoCoinsList == null)
        //       ? Center(
        //           child: CircularProgressIndicator(
        //           color: Colors.yellow.shade700,
        //         ))
        //       : ListView.separated(
        //           separatorBuilder: (context, index) => Divider(
        //                 color: Theme.of(context).dividerColor,
        //               ),
        //           itemCount: _cryptoCoinsList!.length,
        //           itemBuilder: (context, index) {
        //             final coin = _cryptoCoinsList![index];
        //             return CryptoCoinTile(coin: coin);
        //           }),
        // ),
        );
  }
}
