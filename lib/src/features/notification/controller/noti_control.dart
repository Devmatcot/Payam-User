import '../../../../packages.dart';
import '../model/noti_model.dart';
import '/src/features/notification/repository/notification_repo.dart';

final notiController =
    StateNotifierProvider<NotificationController, bool>((ref) {
  return NotificationController(
      notiRepos: ref.read(notiRepoProvider), ref: ref);
});

// final allNotiProvider = FutureProvider((ref) async {
//   return ref.read(notiController.notifier).getAllNotification();
// });

class NotificationController extends StateNotifier<bool> {
  NotificationRepository _notiRepo;
  Ref _ref;

  NotificationController({
    required NotificationRepository notiRepos,
    required Ref ref,
  })  : _notiRepo = notiRepos,
        _ref = ref,
        super(false);

  // Future<List<NotificationModel>> getAllNotification() async {
  //   final res = await _notiRepo.getAllNotification();
  //   return res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) => r);
  // }
}
