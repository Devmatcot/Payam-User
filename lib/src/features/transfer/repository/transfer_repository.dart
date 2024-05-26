import 'package:fpdart/fpdart.dart';

import '../model/transfer_res_model.dart';
import '/packages.dart';

final transferRepositoryProvider = Provider<TransferRepository>((ref) {
  return TransferRepository(
      dioClient: ref.watch(dioClientProvider),
      localStorage: ref.watch(localStorageProvider));
});

class TransferRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;

  TransferRepository({
    required DioClient dioClient,
    required LocalStorage localStorage,
  })  : _dioClient = dioClient,
        _localStorage = localStorage;

  // FutureEither<List<CoinModel>> getAllCoinList() async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(
  //       Endpoints.allCoinList,
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     List coinList = res.data['data'];
  //     return right(coinList.map((e) => CoinModel.fromJson(e)).toList());
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  FutureEither<TransferResponse> wallet2wallet(
      {required String fromUser,
      required String toUser,
      required String amount,
      required String note,
      required String pin}) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.post(
        Endpoints.walletTransfer,
        data: {
          "from_user": fromUser,
          "to_user": '234$toUser',
          "amount": amount,
          "narration": note,
          "transaction_pin": pin
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(TransferResponse.fromJson(res.data['data']));
    } on DioError catch (e) {
      print(e.requestOptions.data);
      return left(Failure(e));
    }
  }

  // FutureVoid verifyPurchase(String txf) async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(
  //       Endpoints.verifyPurchaseCoin(txf),
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     log(res.data.toString());
  //     return right(null);
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  // FutureEither<List<TransactionModel>> transactionHistory() async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(
  //       Endpoints.tranHistory,
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     List history = res.data['data'];
  //     return right(history.map((e) => TransactionModel.fromJson(e)).toList());
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }
}
