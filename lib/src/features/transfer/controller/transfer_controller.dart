import 'package:payam_user/src/features/auth/repository/auth_repo.dart';
import 'package:payam_user/src/features/transfer/repository/transfer_repository.dart';

// import '../presentation/views/sucessful_purchase.dart';

import '/packages.dart';

final transferConProvider =
    StateNotifierProvider<TransferController, bool>((ref) {
  return TransferController(
      authRepo: ref.read(authRepoProvider),
      transferRepository: ref.watch(transferRepositoryProvider),
      ref: ref);
});

final transferChangeProvider = ChangeNotifierProvider<TransferNotifier>((ref) {
  return TransferNotifier(authRepository: ref.read(authRepoProvider));
});

class TransferController extends StateNotifier<bool> {
  final TransferRepository _transferRepository;
  final AuthRepository _authRepository;
  final Ref _ref;
  TransferController(
      {required TransferRepository transferRepository,
      required AuthRepository authRepo,
      required Ref ref})
      : _transferRepository = transferRepository,
        _authRepository = authRepo,
        _ref = ref,
        super(false);
  refreshBalance() async {
    final currentUser = _ref.read(userModelProvider)!;
    final res =
        await _authRepository.currentUser(currentUser.phoneNumber.substring(3));
    return res.fold((l) => AppConfig.handleErrorMessage(l.error), (user) {
      _ref.read(userModelProvider.notifier).update((state) => user);
      return user;
    });
  }

  wallet2wallet({
    required BuildContext context,
    required String toUser,
    required String amount,
    required String note,
  }) async {
    state = true;
    String pin = _ref.read(pinProvider);
    final currentUser = _ref.read(userModelProvider)!;
    final res = await _transferRepository.wallet2wallet(
        fromUser: currentUser.phoneNumber,
        toUser: toUser,
        amount: amount,
        note: note,
        pin: pin);
    res.fold((l) => AppConfig.handleErrorMessage(l.error), (model) {
      showTranSuccessModel(context, 'Payment Successful',
          'You have successful sent $amount to ${model.fullName}');
    });
    refreshBalance();
    state = false;
  }

  // Future<List<TransactionModel>> transactionHistory() async {
  //   final res = await _coinRepository.transactionHistory();
  //   return res.fold((l) {
  //     AppConfig.handleErrorMessage(l.error);
  //     return [];
  //   }, (result) => result);
  // }

  // Future handlePayment(BuildContext context, CoinModel coin) async {
  //   _ref.read(purchaseLoadProvider.notifier).update((state) => true);
  //   final user = _ref.read(userModelProvider);
  //   String txfId = '';
  //   final res = await _coinRepository.getPurchaseTxf(coin.id);
  //   res.fold((l) => AppConfig.handleErrorMessage(l.error), (id) => txfId = id);
  //   final Customer customer = Customer(
  //       email: user.email, name: user.firstName, phoneNumber: user.phoneNumber);
  //   final Flutterwave flutterwave = Flutterwave(
  //       context: context,
  //       publicKey: dotenv.get('PUBLIC_KEY'),
  //       currency: 'NGN',
  //       redirectUrl: 'https://google.com',
  //       txRef: txfId,
  //       amount: coin.price.toString(),
  //       customer: customer,
  //       paymentOptions: "card, payattitude, barter, bank transfer, ussd",
  //       customization: Customization(title: "Test Payment"),
  //       isTestMode: true);
  //   final ChargeResponse response = await flutterwave.charge();

  //   print('waveresponse ${response.toJson()}');
  //   if (response.success!) {
  //     final res = await _coinRepository.verifyPurchase(txfId);
  //     res.fold((l) => Failure(l.error), (r) {
  //       _ref.read(authControllerProvider.notifier).refreshUser();
  //       pushTo(
  //           context,
  //           SucessfulPurchase(
  //             coin: coin.coins.toString(),
  //           )).then((value) => pop(context));
  //     });
  //   } else {
  //     pop(context);
  //     AppConfig.showToast(
  //         'Transaction Fail, please try again', AppColors.redLight);
  //   }
  //   _ref.read(purchaseLoadProvider.notifier).update((state) => false);
  // }
}

class TransferNotifier extends ChangeNotifier {
  final AuthRepository _authRepository;
  TransferNotifier({required AuthRepository authRepository})
      : _authRepository = authRepository;
  Future<UserModel?> currentUser(phone) async {
    print(phone);
    final res = await _authRepository.currentUser('$phone');
    return res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) => r);
  }
}
