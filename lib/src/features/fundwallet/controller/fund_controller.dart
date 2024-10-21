import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/fundwallet/repository/fund_repo.dart';

final fundController = StateNotifierProvider<FundController, bool>((ref) {
  return FundController(fundRepo: ref.read(fundRepoProvider), ref: ref);
});

class FundController extends StateNotifier<bool> {
  FundRepository _fundRepository;
  Ref _ref;
  FundController({required FundRepository fundRepo, required Ref ref})
      : _fundRepository = fundRepo,
        _ref = ref,
        super(false);

  intiateFunding(BuildContext context, String pin, String amount) async {
    state = true;
    final userModel = _ref.read(userModelProvider);
    final res =
        await _fundRepository.initiatTransaction(pin: pin, amount: amount);
    res.fold((l) => AppConfig.handleErrorMessage(l.error), (data) async {
      final res = await _fundRepository.initiatePaystack(
          context: context,
          amount: amount,
          url: data.authorizationUrl,
          email: userModel!.email);
      res.fold(
        (l) => AppConfig.handleErrorMessage(l.error),
        (result) async {
          if (result) {
            final res = await _fundRepository.verifyTransaction(data.reference);
            res.fold((l) => AppConfig.handleErrorMessage(l.error), (s) {});
          }
        },
      );
    });
    state = false;
  }
}
