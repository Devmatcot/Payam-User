import 'package:fpdart/fpdart.dart';
import 'package:payam_user/src/features/transfer/model/bank_model.dart';

import '/packages.dart';
import '../model/beneficiary_model.dart';
import '../model/transfer_res_model.dart';

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

  FutureEither<List<BeneficiaryModel>> getPayamBeneList() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.payamBeneficiary,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List beneList = res.data['data'];
      return right(beneList.map((e) => BeneficiaryModel.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

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

  FutureEither<List<BankModel>> getBankList() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allBank,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List bankList = res.data['data'];
      return right(bankList.map((e) => BankModel.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<BankModel>> getBankSugList(String acctNum) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.post(
        Endpoints.bankSuggestion,
        data: {"account_number": acctNum},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List bankList = res.data['data'];
      return right(bankList.map((e) => BankModel.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }
}
