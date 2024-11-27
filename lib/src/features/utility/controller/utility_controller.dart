import 'package:payam_user/src/features/utility/model/airtime_biller.dart';
import 'package:payam_user/src/features/utility/model/data_plans.dart';
import 'package:payam_user/src/features/utility/repositiory/utility_repo.dart';

import '/packages.dart';

final utilityControler = StateNotifierProvider<UtilityController, bool>((ref) {
  return UtilityController(
      propertiesRepository: ref.watch(propertiesRepoProvider), ref: ref);
});

final getAirtimeBiller = FutureProvider.family<List<AirtimeBiller>, String>((ref, code) async {
  return ref.read(utilityControler.notifier).getAirtimeBiller(code);
});

final dataPlansPro = FutureProvider.family<List<DataPlans>,String >((ref,code ) async {
  return ref.read(utilityControler.notifier).getDataPlans(code);
});

final airtimeAmountProvider = StateProvider<String>((ref) {
  return '';
});

final netWorkSelectProvider = StateProvider<String>((ref) {
  return '';
});

class UtilityController extends StateNotifier<bool> {
  utilityRepository _utilityRepository;
  Ref _ref;

  UtilityController(
      {required utilityRepository propertiesRepository, required Ref ref})
      : _utilityRepository = propertiesRepository,
        _ref = ref,
        super(false);
  Future<List<AirtimeBiller>> getAirtimeBiller(String endpoint) async {
    final res = await _utilityRepository.getAirtimeBiller(endpoint);
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (data) => data);
  }

  Future<List<DataPlans>> getDataPlans(String code) async {
    final res = await _utilityRepository.getDataPlans(code);
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (data) => data);
  }
}
