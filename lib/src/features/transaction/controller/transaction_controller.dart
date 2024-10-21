import 'package:payam_user/src/features/transaction/model/transaction_model.dart';

import '../repository/transaction_repo.dart';
import '/packages.dart';

final transactionConProvider =
    StateNotifierProvider<TransactionControler, bool>((ref) {
  return TransactionControler(
      jobRepository: ref.watch(transRepoProvider), ref: ref);
});

final allTransactionHistory = FutureProvider<List<TransactionHistoryModel>>((ref) async {
  return ref.read(transactionConProvider.notifier).getTransaction();
});
// final jobFullDetailProvider =
//     FutureProvider.family<EditJob, String>((ref, jobId) async {
//   return ref.read(jobControlerProvider.notifier).getFullJobDetail(jobId);
// });
// final allJobTypeProvider = FutureProvider<List<OptionsType>>((ref) async {
//   final res = await ref.read(jobControlerProvider.notifier).getJobType();
//   ref.read(jobTypeListProvider.notifier).update((state) {
//     state.addAll(res);
//     return state;
//   });
//   return res;
// });

// final allAgentJobProvider = FutureProvider<List<AgentJobModel>>((ref) async {
//   return ref.read(jobControlerProvider.notifier).getAllAgentjobs();
// });

// final getJobByIdProvider =
//     FutureProvider.family<JobFullDetails, String>((ref, id) async {
//   return ref.read(jobControlerProvider.notifier).getJobsById(id);
// });

class TransactionControler extends StateNotifier<bool> {
  Ref _ref;
  TransactionRepository _transRepository;
  TransactionControler(
      {required TransactionRepository jobRepository, required Ref ref})
      : _transRepository = jobRepository,
        _ref = ref,
        super(false);

  Future<List<TransactionHistoryModel>> getTransaction() async {
    final phoneNo = await _ref.read(userModelProvider)?.phoneNumber ?? "";
    final res = await _transRepository.getTransaction(phoneNo);
    return res.fold((l) => AppConfig.handleErrorMessage(l.error), (trans) => trans);
  }
}
