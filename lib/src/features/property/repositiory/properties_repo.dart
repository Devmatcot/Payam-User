import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';

import '../../auth/repository/location_service.dart';
import '../../jobs/model/job_type.dart';
// import '../model/add_property.dart';
// import '../model/homefeed_properties.dart';
// import '../model/property_model.dart';
import '/packages.dart';
// import '/src/features/property/model/agent_property.dart';

final propertiesRepoProvider = Provider<PropertiesRepository>((ref) {
  return PropertiesRepository(
      dioClient: ref.watch(dioClientProvider),
      localStorage: ref.watch(localStorageProvider));
});

class PropertiesRepository {
  final DioClient _dioClient;
  final LocalStorage _localStorage;
  PropertiesRepository(
      {required DioClient dioClient, required LocalStorage localStorage})
      : _dioClient = dioClient,
        _localStorage = localStorage;

  // FutureEither<HomeFeedProperties> getHomeDetails() async {
  //   try {
  //     LocationService _location = LocationService();
  //     final location = await _location.getLocation();
  //     print("location data ${location}");
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(
  //       location.isEmpty
  //           ? Endpoints.tryAllPro
  //           : Endpoints.allProperties(
  //               location.first.subAdministrativeArea ?? "",
  //               location.first.administrativeArea),

  //       // queryParameters: {
  //       //   'city': location.first.subAdministrativeArea,
  //       //   'state': location.first.administrativeArea
  //       // },
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $accessToken'},
  //       ),
  //     );
  //     print('All Data' + res.data.toString());
  //     return right(HomeFeedProperties.fromJson(res.data['data']));
  //   } on DioError catch (e) {
  //     print('All Error Data${e.response?.data.toString()}');

  //     return left(Failure(e));
  //   }
  // }

  // FutureEither<PropertiesDetailsModel> getPropertiesById(String id) async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(
  //       Endpoints.propertiesbyId(id),
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     print(res);
  //     return right(PropertiesDetailsModel.fromJson(res.data['data']));
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  FutureVoid addPropertiesToWatchList(String id, bool favoriteState) async {
    try {
      Future.delayed(Duration(seconds: 3));

      String accessToken = await _localStorage.get(Endpoints.access_token);
      log('fav state $favoriteState');
      if (!favoriteState) {
        await _dioClient.post(Endpoints.addWatchListbyId(id),
            options:
                Options(headers: {'Authorization': 'Bearer $accessToken'}));
      } else {
        _dioClient.delete(Endpoints.addWatchListbyId(id),
            options:
                Options(headers: {'Authorization': 'Bearer $accessToken'}));
      }

      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  // FutureEither<List<Listing>> getAllWatchListProperties() async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(Endpoints.allWatchList,
  //         options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
  //     List watchList = res.data['data'];
  //     return right(watchList.map((json) => Listing.fromJson(json)).toList());
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  // FutureEither<List<AgentProperty>> getAgentProperties() async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(Endpoints.allAgentProperties,
  //         options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
  //     List proList = res.data['data'];
  //     return right(
  //         proList.map((json) => AgentProperty.fromJson(json)).toList());
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  Future<FilePickerResult?> pickImage([bool pickMultiple = true]) async {
    FilePicker? _filePicker = FilePicker.platform;
    final result = await _filePicker.pickFiles(
        allowMultiple: pickMultiple,
        allowCompression: true,
        type: FileType.image);
    if (result != null) {
      return result;
    } else {}
    return null;
  }

  FutureEither<List<OptionsType>> getAllAppliance() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);

      final res = await _dioClient.get(
        Endpoints.propertiesAppliance,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List data = res.data['data'];
      return right(data.map((e) => OptionsType.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<OptionsType>> getPropertType() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allPropertyType,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List data = res.data['data'];
      return right(data.map((e) => OptionsType.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<OptionsType>> getResType() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allResType,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List data = res.data['data'];
      return right(data.map((e) => OptionsType.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<OptionsType>> getCondType() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.propertyCondition,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      List data = res.data['data'];
      return right(data.map((e) => OptionsType.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  // FutureVoid addProperty(
  //   AddProperty property,
  //   List<PlatformFile> filepath,
  //   String? proId,
  // ) async {
  //   try {
  //     await _dioClient.refreshToken();
  //     String accessToken = await _localStorage.get(Endpoints.access_token);

  //     FormData fullData = FormData.fromMap({
  //       "name": property.name,
  //       "sub_details": property.subDetails,
  //       "description": property.description,
  //       "address": property.address,
  //       "city": property.city,
  //       "state": property.state,
  //       "property_type": property.propertyType,
  //       "price": property.price,
  //       "is_negotiable": property.isNegotiable,
  //       "condition": property.condition,
  //       "year_built":
  //           "${property.yearBuilt?.year.toString().padLeft(4, '0')}-${property.yearBuilt?.month.toString().padLeft(2, '0')}-${property.yearBuilt?.day.toString().padLeft(2, '0')}",
  //       "sqft_mass": property.sqftMass,
  //       "type_of_residence": property.typeOfResidence,
  //       "num_of_bedroom": property.numOfMainBedroom,
  //       "num_of_bathroom": property.numOfMasterBedroom,
  //       "government_approved": property.governmentApproved,
  //       "secured_environment": property.securedEnvironment,
  //       "parking_space": property.parkingSpace,
  //       "appliances": property.appliances,
  //     });
  //     if (filepath.isNotEmpty) {
  //       for (var file in filepath) {
  //         fullData.files.addAll([
  //           MapEntry("images", await MultipartFile.fromFile(file.path!)),
  //         ]);
  //       }
  //     }

  //     if (proId == null) {
  //       await _dioClient.post(
  //         Endpoints.addProperty,
  //         data: fullData,
  //         options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //       );
  //     } else {
  //       await _dioClient.patch(
  //         Endpoints.agentPropertiesbyId(proId),
  //         data: fullData,
  //         options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //       );
  //     }

  //     return right(null);
  //   } on DioError catch (e) {
  //     log(e.response!.data.toString());
  //     return left(Failure(e));
  //   }
  // }

  // FutureEither<PropertiesDetailsModel> getAgentPropertiesById(String id) async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     final res = await _dioClient.get(
  //       Endpoints.agentPropertiesbyId(id),
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     return right(PropertiesDetailsModel.fromJson(res.data['data']));
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  FutureVoid checkListingCoin() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      await _dioClient.get(
        Endpoints.checkProListingCoin,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right('');
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }
}
