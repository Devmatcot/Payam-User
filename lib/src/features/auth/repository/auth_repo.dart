import 'package:fpdart/fpdart.dart';

import '../../../../packages.dart';

final authRepoProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
      dioClient: ref.read(dioClientProvider),
      localStroage: ref.read(localStorageProvider));
});

class AuthRepository {
  DioClient _dioClient;
  LocalStorage _localStorage;
  AuthRepository({required DioClient dioClient, required localStroage})
      : _dioClient = dioClient,
        _localStorage = localStroage;

  FutureEither<String> createUserAcct(
      {required String firstName,
      required String lastName,
      required String phoneNum,
      required String email,
      required String password,
      required bool isAgent}) async {
    try {
      final response = await _dioClient.post(Endpoints.createUserAcct, data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": "+234${phoneNum.substring(1)}",
        "password": password,
        "is_agent": isAgent
      });
      // print(response.data);
      return right(response.data['status']);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<UserModel> login(
      String email, String password, bool isAgent) async {
    try {
      final response = await _dioClient.post(
          isAgent ? Endpoints.agentLogin : Endpoints.userLogin,
          data: {"email": email.trim(), "password": password.trim()});
      Map<String, dynamic> json = response.data['data']['profile_data'];
      final userModel = UserModel.fromJson(json);
      String accessToken = response.data['data']['tokens']['access'];
      String refreshToken = response.data['data']['tokens']['refresh'];
      await _localStorage.set(Endpoints.access_token, accessToken);
      await _localStorage.set(Endpoints.refresh_token, refreshToken);
      await _localStorage.setMap(Endpoints.userDataMap, json);
      return right(userModel);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid logOut() async {
    try {
      String refreshToken = await _localStorage.get(Endpoints.refresh_token);
      await _dioClient.post(Endpoints.logout, data: {"refresh": refreshToken});
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid sendEmailOTP(String email, [bool isForget = false]) async {
    try {
      await _dioClient.post(
          isForget ? Endpoints.sendForgetOtp : Endpoints.sendEmailVerifyOtp,
          data: {"email": email});
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid verifyEmailOTP(String email, String OTP, bool isForget) async {
    try {
      final res = await _dioClient
          .post(isForget?Endpoints.verifyForgetOTP:Endpoints.verifyEmailOTP, data: {"email": email, "otp": OTP});
      if (isForget) {
        await _localStorage.set(Endpoints.access_token, res.data['data']);
      }
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<UserModel> refreshUser(String userType) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
   
      final response = await _dioClient.get(
        Endpoints.updateProfile(userType),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      Map<String, dynamic> json = response.data['data'];
      final userModel = UserModel.fromJson(json);
      return right(userModel);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid updateUserDetail(
      {required String firstName,
      required String lastName,
      required String avatar,
      required String userType,
      required String phoneNo}) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      await _dioClient.patch(
        Endpoints.updateProfile(userType),
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "phone_number": phoneNo
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right('');
    } on DioError catch (e) {
      print(e.response?.data);
      return left(Failure(e));
    }
  }

  FutureVoid changePassword(String password) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      await _dioClient.post(
        Endpoints.changePassword,
        data: {"password": password, "confirm_pass": password},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right('');
    } on DioError catch (e) {
      print(e.response?.data);
      return left(Failure(e));
    }
  }

   FutureVoid newPassword(String password) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      await _dioClient.post(
        Endpoints.newPassword(accessToken),
        data: {"password": password, "confirm_pass": password},
      );
      return right('');
    } on DioError catch (e) {
      print(e.response?.data);
      return left(Failure(e));
    }
  }
}
