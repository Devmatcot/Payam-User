import 'package:payam_user/src/features/auth/repository/auth_repo.dart';
import 'package:payam_user/src/features/transfer/model/beneficiary_model.dart';
import 'package:payam_user/src/features/transfer/repository/transfer_repository.dart';

import '/packages.dart';
import '../model/bank_model.dart';

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

final payamBeneProvider = FutureProvider((ref) async {
  return ref.read(transferConProvider.notifier).payamBeneList();
});

final bankListProvider = FutureProvider((ref) async {
  return ref.read(transferConProvider.notifier).getBankList();
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

  Future<List<BeneficiaryModel>> payamBeneList() async {
    final res = await _transferRepository.getPayamBeneList();
    return res.fold((l) {
      AppConfig.handleErrorMessage(l.error);
      return [];
    }, (result) => result);
  }

  Future<List<BankModel>> getBankList() async {
    final res = await _transferRepository.getBankList();
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (result) => result);
  }

  Future<List<BankModel>> getBankSugList(String acctNo) async {
    final res = await _transferRepository.getBankSugList(acctNo);
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (result) => result);
  }
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

  Future<BeneficiaryModel?> getPayamUser(phone) async {
    print(phone);
    final res = await _authRepository.getPayamUser('$phone');
    return res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) => r);
  }
}
