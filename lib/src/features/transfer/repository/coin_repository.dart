import 'dart:developer';

import 'package:fpdart/fpdart.dart';

import '../model/coin_model.dart';
import '../model/trans_model.dart';
import '/packages.dart';


final coinRepositoryProvider = Provider<CoinRepository>((ref) {
  return CoinRepository(
      dioClient: ref.watch(dioClientProvider),
      localStorage: ref.watch(localStorageProvider));
});

class CoinRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;
  CoinRepository(
      {required DioClient dioClient, required LocalStorage localStorage})
      : _dioClient = dioClient,
        _localStorage = localStorage;

  FutureEither<List<CoinModel>> getAllCoinList() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allCoinList,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List coinList = res.data['data'];
      return right(coinList.map((e) => CoinModel.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<String> getPurchaseTxf(String coinId) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.purchaseCoinbyId(coinId),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(res.data['data']['transaction_reference']);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid verifyPurchase(String txf) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.verifyPurchaseCoin(txf),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      log(res.data.toString());
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<TransactionModel>> transactionHistory() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.tranHistory,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List history = res.data['data'];
      return right(history.map((e) => TransactionModel.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }
}
