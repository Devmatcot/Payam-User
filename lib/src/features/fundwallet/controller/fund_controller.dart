import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/fundwallet/repository/fund_repo.dart';

import '../../../core/shared/web_view.dart';

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
    String status = '';
    final userModel = _ref.read(userModelProvider);
    final res =
        await _fundRepository.initiatTransaction(pin: pin, amount: amount);
    res.fold((l) => AppConfig.handleErrorMessage(l.error), (data) async {
      // final res = await _fundRepository.initiatePaystack(
      //     context: context,
      //     amount: amount,
      //     url: data.authorizationUrl,
      //     email: userModel!.email);

      pushTo(
          context,
          WebViewScreen(
            url: data.authorizationUrl,
            title: 'Payment',
            // canPop: false,
            onPopInvokedWithResult: (pop, p1) async {
              // final res =
              //     await _fundRepository.verifyTransaction(data.reference);
              // res.fold((l) {
              //   AppConfig.handleErrorMessage(l.error);
              //   status = 'Fail';
              // }, (r) {
              //   AppConfig.showAlert(context, 'Wallet funded successfully');
              //   status = 'Success';
              // });

              print('data $pop and $p1');
            },
            actions: [
              TextButton(
                  onPressed: () async {
                    pop(context, true);
                    await _ref
                        .read(authControllerProvider.notifier)
                        .currentUser(context,
                            '${userModel?.phoneNumber.substring(3)}', true);
                  },
                  child: Text('Done', style: AppTextStyle.secBtnStyle))
            ],
          )).then((v) async {
        print('Verify transaction $status');
        AppConfig.showToast('Transaction Completed');
        await _ref.read(authControllerProvider.notifier).currentUser(
            context, '${userModel?.phoneNumber.substring(3)}', true);
      });
    });
    state = false;
  }
}
