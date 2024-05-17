// import 'dart:convert';
// import 'dart:developer';

// import '../../coin/controller/coin_controller.dart';
// import '../../escrow/controller/escrow_controller.dart';
// import '../../home/controller/home_controller.dart';
// import '../model/acct_enum.dart';
// import '../presentation/views/change_password.dart';
// import '../presentation/views/verify_email.dart';
// import '../presentation/views/verify_otp.dart';
// import '../presentation/views/welcome_back.dart';
import 'package:payam_user/src/features/auth/presentation/views/create_passcode.dart';
import 'package:payam_user/src/features/auth/presentation/views/login_passcode.dart';
import 'package:payam_user/src/features/auth/presentation/views/phone_otp.dart';
import 'package:payam_user/src/features/auth/presentation/views/success_registration.dart';

import '../presentation/views/create_conPasscode.dart';
import '../repository/auth_repo.dart';
import '/packages.dart';
// import '/src/features/auth/presentation/views/switch_account.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authRepos: ref.read(authRepoProvider),
      ref: ref,
      localStroage: ref.read(localStorageProvider));
});

final userModelProvider = StateProvider<UserModel?>((ref) {
  return null;
});

// final currentUserProvider = FutureProvider((ref) async {
//   return ref.read(authControllerProvider.notifier).currentUser(context, phone);
// });

class AuthController extends StateNotifier<bool> {
  AuthRepository _authrepo;
  LocalStorage _localStorage;
  Ref _ref;
  AuthController(
      {required AuthRepository authRepos,
      required Ref ref,
      required LocalStorage localStroage})
      : _authrepo = authRepos,
        _ref = ref,
        _localStorage = localStroage,
        super(false);

  createUserAcct({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String phoneNum,
    required String email,
    required String gender,
  }) async {
    try {
      state = true;
      final userDob = _ref.read(datePickerProvider);
      final res = await _authrepo.createUserAcct(
        firstName: firstName,
        lastName: lastName,
        phoneNum: phoneNum,
        dob: userDob ?? DateTime.now(),
        gender: gender,
        email: email,
      );
      res.fold((l) {
        state = false;
        AppConfig.handleErrorMessage(
          l.error,
        );
      }, (r) async {
        AppConfig.showToast(
            'Profile Created Successfully, proceed to passcode setup!',
            null,
            () {});
        await Future.delayed(Duration(seconds: 3));
        state = false;
        pushToFirst(
          context,
          CreatePassCodeScreen(
            phoneNumber: phoneNum,
            isForget: false,
          ),
        );
      });
    } catch (e) {}
  }

  sendSMSOTP(BuildContext context, String phone,
      [bool isForget = false]) async {
    state = true;
    final res = await _authrepo.sendSMSOTP(phone, isForget);
    res.fold((l) {
      state = false;
      AppConfig.handleErrorMessage(
        l.error,
      );
    }, (r) async {
      AppConfig.showToast(
          'Verification code sent successfully. Please check your phone',
          null,
          () {});
      await Future.delayed(Duration(seconds: 3));
      state = false;
      pushTo(context, PhoneOTPScreen(phoneNumber: phone, isForget: isForget));
    });
  }

  verifySMSOTP(
      BuildContext context, String phone, String OTP, bool isForget) async {
    state = true;
    final res = await _authrepo.verifySMSOTP(phone, OTP, isForget);
    res.fold((l) {
      state = false;
      AppConfig.handleErrorMessage(l.error);
    }, (r) async {
      AppConfig.showToast(
          'Phone Number verified Successfully, Lets Proceed', null, () {});
      await Future.delayed(Duration(seconds: 3));
      state = false;
      if (isForget) {
        pushTo(context,
            CreatePassCodeScreen(phoneNumber: phone, isForget: isForget));
      } else {
        pushTo(context, CreateProfileScreen(phoneNumber: phone));
      }
    });
  }

  loginUser(
    BuildContext context,
    String phone,
  ) async {
    state = true;
    final result = await _authrepo.login(phone);
    result.fold((e) async {
      print(e.error.response?.statusCode);

      AppConfig.handleErrorMessage(e.error);
    }, (u) {
      pushTo(context, LoginPassCodeScreen(phoneNum: phone));
    });
    state = false;
  }

  loginPassCode(
    BuildContext context,
    String phone,
    String passcode,
  ) async {
    state = true;
    final result = await _authrepo.loginPassCode(phone, passcode);
    result.fold((e) async {
      print(e.error.response?.statusCode);

      AppConfig.handleErrorMessage(e.error);
    }, (u) {
      currentUser(context, phone);
    });
    state = false;
  }

 Future<UserModel> currentUser(BuildContext context, String phone) async {
    final res = await _authrepo.currentUser(phone);
    return res.fold((l) => AppConfig.handleErrorMessage(l.error), (user) {
      _ref.read(userModelProvider.notifier).update((state) => user);
      pushToAndClearStack(context, ControlScreen());
      return user;
    });
  }

  autoLogin(BuildContext context) async {
    // final firstTime = await _localStorage.get(Endpoints.firstTime);
    // String acctType = await _localStorage.get(Endpoints.acctType) ?? 'user';
    // final String userData =
    //     await _localStorage.get(Endpoints.userDataMap) ?? '';
    // log(userData);
    // await Future.delayed(Duration(seconds: 3));
    // if (firstTime == '1') {
    //   if (userData != '') {
    //     _ref.read(acctTypeProvider.notifier).update((state) =>
    //         acctType == 'user' ? AccountType.user : AccountType.agent);
    //     // _ref
    //     //     .watch(userModelProvider.notifier)
    //     //     .update((state) => UserModel.fromJson(jsonDecode(userData)));
    //     pushToAndClearStack(
    //         context,
    //         WelcomeBackScreen(
    //             userData: UserModel.fromJson(jsonDecode(userData))));
    //   } else {
    //     pushToAndClearStack(context, LoginScreen());
    //   }
    // } else {
    pushToAndClearStack(context, OnboardingScreen());
    // }
  }

  // logOut(BuildContext context) async {
  //   state = true;

  //   await _localStorage.remove(Endpoints.access_token);
  //   await _localStorage.remove(Endpoints.userDataMap);
  //   await Future.delayed(Duration(seconds: 3));
  //   pushToAndClearStack(context, LoginScreen());
  //   _ref.read(homeControllerProvider.notifier).updatePage(0);
  //   state = false;
  // }

  // refreshUser() async {
  //   AccountType acctType = _ref.read(acctTypeProvider);
  //   final res = await _authrepo.refreshUser(acctType.name);
  //   res.fold((l) => AppConfig.handleErrorMessage(l.error), (userModel) {
  //     _ref.read(userModelProvider.notifier).update(
  //           (state) => userModel,
  //         );
  //   });
  // }

  // changeAcct(bool? val) {
  //   if (val!) {
  //     _ref.read(acctTypeProvider.notifier).update((state) => AccountType.agent);
  //   } else {
  //     _ref.read(acctTypeProvider.notifier).update((state) => AccountType.user);
  //   }
  // }

  // updateUserDetail(
  //     {required BuildContext context,
  //     required String firstName,
  //     required String lastName,
  //     required String avatar,
  //     required String phoneNo}) async {
  //   AccountType acctType = _ref.read(acctTypeProvider);
  //   print(acctType.name);
  //   state = true;
  //   final res = await _authrepo.updateUserDetail(
  //       firstName: firstName,
  //       lastName: lastName,
  //       userType: acctType.name,
  //       avatar: avatar,
  //       phoneNo: phoneNo);
  //   res.fold((l) {
  //     state = false;
  //     AppConfig.handleErrorMessage(l.error);
  //   }, (r) async {
  //     AppConfig.showToast('Profile update successfully!');
  //     refreshUser();
  //     state = false;
  //     // pop(context);
  //   });
  // }

  // changeUsePassword(BuildContext context, String password) async {
  //   state = true;
  //   final res = await _authrepo.changePassword(password);
  //   res.fold((l) {
  //     state = false;
  //     AppConfig.handleErrorMessage(l.error);
  //   }, (r) async {
  //     AppConfig.showToast('Password change successfully!');
  //     await Future.delayed(Duration(seconds: 2)).then((value) {
  //       state = false;
  //       pop(context);
  //     });
  //     // pop(context);
  //   });
  // }

  createPasscode(BuildContext context, String phoneNum, String passcode,
      bool isConfirm, bool isForget) async {
    state = true;
    final res =
        await _authrepo.createPasscode(phoneNum, passcode, isConfirm, isForget);
    res.fold((l) {
      state = false;
      AppConfig.handleErrorMessage(l.error);
    }, (r) async {
      AppConfig.showToast(
          'Passcode ${isConfirm ? 'confirmed' : 'created'} successfully!');
      await Future.delayed(Duration(seconds: 2));
      state = false;
      if (!isConfirm && !isForget) {
        pushTo(context, ConfirmPassCodeScreen(phoneNumber: phoneNum));
      } else {
        pushToFirst(context, SuccessRegistration(isForget: isForget));
      }
    });
  }

  // switchUser(AccountType acctType) async {
  //   state = true;
  //   // await Future.delayed(Duration(seconds: 2));
  //   final userData = _ref.read(userModelProvider);

  //   pushToAndClearStack(
  //       NavigatorKey.myKey.currentState!.context,
  //       SwitchAcctScreen(
  //         userData: userData,
  //         acct: acctType,
  //       ));
  //   // await Future.delayed(Duration(seconds: 2));
  //   // _ref.read(acctTypeProvider.notifier).update((state) => acctType);

  //   // _ref.read(homeControllerProvider.notifier).updatePage(0);

  //   state = false;
  // }

  // switchLogin(
  //   BuildContext context,
  //   String email,
  //   String password,
  //   UserModel userData,
  // ) async {
  //   _ref.invalidate(allTransactionProvider);
  //   _ref.invalidate(currentPageProvider);
  //   _ref.invalidate(homeControllerProvider);
  //   _ref.invalidate(getAllEscrowProvider);
  //   final acctType = _ref.read(acctTypeProvider);
  //   state = true;
  //   final result =
  //       await _authrepo.login(email, password, acctType != AccountType.user);
  //   result.fold((e) async {
  //     print(e.error.response?.statusCode);
  //     if (e.error.response?.statusCode == 400) {
  //       AppConfig.showToast(
  //           'Your Email needs to be verify before you can sucessfully login',
  //           Colors.red);
  //       await Future.delayed(Duration(seconds: 2));
  //       state = false;
  //       pushTo(
  //         context,
  //         VerifyEmailScreen(
  //           isRestPassword: false,
  //           email: email,
  //         ),
  //       );
  //     } else if (e.error.response?.statusCode == 404) {
  //       state = true;
  //       final res = await _authrepo.createUserAcct(
  //           firstName: userData.firstName,
  //           lastName: userData.lastName,
  //           phoneNum: userData.phoneNumber,
  //           email: userData.email,
  //           password: password,
  //           isAgent: acctType == AccountType.agent ? true : false);
  //       res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) async {
  //         await login(context, email, password);
  //       });
  //     } else {
  //       state = false;
  //       AppConfig.handleErrorMessage(
  //         e.error,
  //       );
  //     }
  //   }, (userModel) {
  //     _localStorage.set(Endpoints.acctType, acctType.name);
  //     state = false;
  //     _ref.read(userModelProvider.notifier).update(
  //           (state) => userModel,
  //         );
  //     if (userModel.avatar == '') {
  //       pushTo(context, SetProfilePic());
  //     } else {
  //       pushToAndClearStack(context, ControlScreen());
  //     }
  //   });
  // }
}
