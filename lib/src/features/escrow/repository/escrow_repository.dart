import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';


import '/packages.dart';

final escrowRepoProvider = Provider<EscrowRepository>((ref) {
  return EscrowRepository(
      dioClient: ref.read(dioClientProvider),
      localStorage: ref.read(localStorageProvider));
});

class EscrowRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;
  EscrowRepository(
      {required DioClient dioClient, required LocalStorage localStorage})
      : _dioClient = dioClient,
        _localStorage = localStorage;

  FutureVoid requestEscrow(
      {required String id,
      required String note,
      required double amount,
      required String date}) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      await _dioClient.post(Endpoints.requestEscrowById(id),
          data: {"amount": amount, "due_date": date, "note": note},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return right('');
    } on DioError catch (e) {
      print(e.response?.data);
      return left(Failure(e));
    }
  }

  // FutureEither<List<EscrowModel>> getAllEscrowList() async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(Endpoints.allEscrow,
  //         options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
  //     List list = res.data['data'];
  //     return right(list.map((e) => EscrowModel.fromJson(e)).toList());
  //   } on DioError catch (e) {
  //     print(e.response?.data);

  //     return left(Failure(e));
  //   }
  // }

  // FutureEither<EscrowFullDetailModel> getEscrowById(String id) async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(Endpoints.getEscrowById(id),
  //         options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
  //     return right(EscrowFullDetailModel.fromJson(res.data));
  //   } on DioError catch (e) {
  //     print(e.response?.data);

  //     return left(Failure(e));
  //   }
  // }

  FutureVoid acceptEscrow(String action, String id) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.post(Endpoints.acceptEscrowById(action, id),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid sendProofOfPay(
    String id,
    PlatformFile filepath,
  ) async {
    try {
      await _dioClient.refreshToken();
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.post(
        Endpoints.uploadProof(id),
        data: FormData.fromMap(
            {"payment_proof": await MultipartFile.fromFile(filepath.path!)}),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(null);
    } on DioError catch (e) {
      print(e.response?.data.toString());
      return left(Failure(e));
    }
  }
}
