import 'package:fpdart/fpdart.dart';
import 'package:payam_user/src/features/utility/model/airtime_biller.dart';
import 'package:payam_user/src/features/utility/model/data_plans.dart';

import '/packages.dart';

final propertiesRepoProvider = Provider<utilityRepository>((ref) {
  return utilityRepository(
      dioClient: ref.watch(dioClientProvider),
      localStorage: ref.watch(localStorageProvider));
});

class utilityRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;
  utilityRepository(
      {required DioClient dioClient, required LocalStorage localStorage})
      : _dioClient = dioClient,
        _localStorage = localStorage;

  FutureEither<List<AirtimeBiller>> getAirtimeBiller(String endpoint) async {
    try {
      final res = await _dioClient.getT(endpoint);
      List airBiller = res.data['data'];
      return right(
          airBiller.map((data) => AirtimeBiller.fromJson(data)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<DataPlans>> getDataPlans(String code) async {
    try {
      final res = await _dioClient.getT(Endpoints.getBillerInfo(code));
      List dataPlans = res.data['data'];
      return right(dataPlans.map((data) => DataPlans.fromJson(data)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }
}
