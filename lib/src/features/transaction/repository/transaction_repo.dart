import 'package:fpdart/fpdart.dart';
import 'package:payam_user/src/features/transaction/model/transaction_model.dart';

import '../../../../packages.dart';

final transRepoProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(
      dioClient: ref.watch(dioClientProvider),
      localStorage: ref.watch(localStorageProvider));
});

class TransactionRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;
  TransactionRepository(
      {required DioClient dioClient, required LocalStorage localStorage})
      : _dioClient = dioClient,
        _localStorage = localStorage;

  FutureEither<List<TransactionHistoryModel>> getTransaction(
      String phone) async {
    try {
      final accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(Endpoints.transactionHistory,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      List trans = res.data['data'];
      return right(
          trans.map((e) => TransactionHistoryModel.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }
}
