import 'package:fpdart/fpdart.dart';

import '../../../../packages.dart';
import '/src/features/notification/model/noti_model.dart';

final notiRepoProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(
      dioClient: ref.read(dioClientProvider),
      localStroage: ref.read(localStorageProvider));
});

class NotificationRepository {
  DioClient _dioClient;
  LocalStorage _localStorage;
  NotificationRepository({required DioClient dioClient, required localStroage})
      : _dioClient = dioClient,
        _localStorage = localStroage;

  // FutureEither<List<NotificationModel>> getAllNotification() async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(
  //       Endpoints.notification,
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     List json = res.data['data'];
  //     return right(json.map((e) => NotificationModel.fromJson(e)).toList());
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }
}
