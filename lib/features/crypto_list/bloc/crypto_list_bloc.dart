import "package:equatable/equatable.dart";
import "package:flutter_application_1/repositories/crypto_coins/abstract_coins_repository.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../repositories/crypto_coins/models/crypto_coin.dart";
part "crypto_list_event.dart";
part "crypto_list_state.dart";

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final cryptoCoinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinList: cryptoCoinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
