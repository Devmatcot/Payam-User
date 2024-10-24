import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:payam_user/src/features/transfer/model/beneficiary_model.dart';

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

  FutureEither<String> createUserAcct({
    required String firstName,
    required String lastName,
    required String phoneNum,
    required String email,
    required DateTime dob,
    required String gender,
  }) async {
    try {
      print(dob.toSplashForm());
      print(Endpoints.createUserAcct(phoneNum) + "  URL");
      final body = {
        "first_name": firstName.trim(),
        "last_name": lastName.trim(),
        "email": email.trim(),
        "gender": gender.toLowerCase(),
        "date_of_birth": dob.toSplashForm()
      };
      log(body.toString());
      await _dioClient.put(Endpoints.createUserAcct(phoneNum), data: body);
      return right('');
    } on DioError catch (e) {
      print(e.response?.realUri);
      print(e.response?.data);
      return left(Failure(e));
    }
  }

  FutureVoid login(String phone) async {
    try {
      await _dioClient
          .post(Endpoints.userLogin, data: {"phone_number": "234$phone"});
      return right('');
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid loginPassCode(String phone, String passcode) async {
    try {
      final response = await _dioClient.post(Endpoints.userPassCodeLogin,
          data: {"phone_number": "234$phone", "passcode": passcode});
      String accessToken = response.data['token'];
      await _localStorage.set(Endpoints.access_token, accessToken);
      return right('');
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  // FutureVoid logOut() async {
  //   try {
  //     String refreshToken = await _localStorage.get(Endpoints.refresh_token);
  //     await _dioClient.post(Endpoints.logout, data: {"refresh": refreshToken});
  //     return right(null);
  //   } on DioError catch (e) {
  //     return left(Failure(e));
  //   }
  // }

  FutureVoid sendSMSOTP(String phone, [bool isForget = false]) async {
    try {
      await _dioClient.post(
          isForget ? Endpoints.sendForgetOtp : Endpoints.sendSMSOtp,
          data: {"phone_number": "234$phone"});
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid verifySMSOTP(String phone, String OTP, bool isForget) async {
    try {
      await _dioClient.post(
          isForget ? Endpoints.verifyForgetOTP : Endpoints.verifySMSOTP,
          data: {"phone_number": "234$phone", "otp": OTP});
      // if (isForget) {
      //   await _localStorage.set(Endpoints.access_token, res.data['data']);
      // }
      return right(null);
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<UserModel> currentUser(String phone) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final response = await _dioClient.get(Endpoints.userProfile,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      Map<String, dynamic> json = response.data['data'];
      log(response.toString());
      final userModel = UserModel.fromJson(json);
      return right(userModel);
    } on DioError catch (e) {
      log(e.requestOptions.data.toString());

      print(e.requestOptions.data);
      return left(Failure(e));
    }
  }

  FutureEither<BeneficiaryModel> getPayamUser(String phone) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final response = await _dioClient.get(Endpoints.getPayamUser(phone),
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      Map<String, dynamic> json = response.data['data'];
      log(response.toString());
      final userModel = BeneficiaryModel.fromJsonBene(json);
      return right(userModel);
    } on DioError catch (e) {
      log(e.requestOptions.data.toString());

      print(e.requestOptions.data);
      return left(Failure(e));
    }
  }

  // FutureVoid updateUserDetail(
  //     {required String firstName,
  //     required String lastName,
  //     required String avatar,
  //     required String userType,
  //     required String phoneNo}) async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     await _dioClient.patch(
  //       Endpoints.updateProfile(userType),
  //       data: {
  //         "first_name": firstName,
  //         "last_name": lastName,
  //         "phone_number": phoneNo
  //       },
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     return right('');
  //   } on DioError catch (e) {
  //     print(e.response?.data);
  //     return left(Failure(e));
  //   }
  // }

  // FutureVoid changePassword(String password) async {
  //   try {
  //     String accessToken = await _localStorage.get(Endpoints.access_token);
  //     await _dioClient.post(
  //       Endpoints.changePassword,
  //       data: {"password": password, "confirm_pass": password},
  //       options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
  //     );
  //     return right('');
  //   } on DioError catch (e) {
  //     print(e.response?.data);
  //     return left(Failure(e));
  //   }
  // }

  FutureVoid createPasscode(
      String phoneNum, String passcode, bool isConfirm, bool isForget) async {
    try {
      await _dioClient.post(
        isForget
            ? Endpoints.newPasscode
            : (isConfirm
                ? Endpoints.confirmCreatePasscode
                : Endpoints.createPasscode),
        data: {"phone_number": '234$phoneNum', "passcode": passcode},
      );
      return right('');
    } on DioError catch (e) {
      print(e.response?.data);
      return left(Failure(e));
    }
  }
}
