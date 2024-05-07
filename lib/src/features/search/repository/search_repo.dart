import 'package:fpdart/fpdart.dart';

import '../../../../packages.dart';
// import '/src/features/property/model/homefeed_properties.dart';

final searchRepoProvider = Provider<SearchRepository>((ref) {
  return SearchRepository(
      dioClient: ref.read(dioClientProvider),
      localStorage: ref.watch(localStorageProvider));
});

class SearchRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;
  SearchRepository(
      {required DioClient dioClient, required LocalStorage localStorage})
      : _dioClient = dioClient,
        _localStorage = localStorage;

  // FutureEither<JobModel> filterProperties() async {
  //   try {
  //     await _dioClient.get(Endpoints.filterProperties, queryParameters: {});
  //     return right(r);
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  // FutureEither<List<Listing>> searchProperties(String text) async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(Endpoints.searchProperties,
  //         queryParameters: {"search": text},
  //         options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
  //     List searchRes = res.data['data'];
  //     return right(searchRes.map((e) => Listing.fromJson(e)).toList());
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }
}
