import 'package:payam_user/src/features/transfer/model/coin_model.dart';
import 'package:payam_user/src/features/transfer/repository/coin_repository.dart';

// import '../presentation/views/sucessful_purchase.dart';
import '/packages.dart';

final coinControllerProvider = Provider<CoinController>((ref) {
  return CoinController(
      coinRepository: ref.watch(coinRepositoryProvider), ref: ref);
});

// final allCoinProvider = FutureProvider((ref) async {
//   return ref.watch(coinControllerProvider).getAllCoinList();
// });

// final allTransactionProvider = FutureProvider((ref) async {
//   return ref.watch(coinControllerProvider).transactionHistory();
// });

final purchaseLoadProvider = StateProvider<bool>((ref) {
  return false;
});

class CoinController extends StateNotifier<List<CoinModel>> {
  final CoinRepository _coinRepository;
  final Ref _ref;
  CoinController({required CoinRepository coinRepository, required Ref ref})
      : _coinRepository = coinRepository,
        _ref = ref,
        super([]);

  // Future<List<CoinModel>> getAllCoinList() async {
  //   final res = await _coinRepository.getAllCoinList();
  //   return res.fold((failure) {
  //     AppConfig.handleErrorMessage(failure.error);
  //     return [];
  //   }, (result) {
  //     return result;
  //   });
  // }

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
