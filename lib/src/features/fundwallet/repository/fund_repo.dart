import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/fundwallet/model/fund_model.dart';

import '../../../core/shared/web_view.dart';

final fundRepoProvider = Provider<FundRepository>((ref) {
  return FundRepository(
      dioClient: ref.read(dioClientProvider),
      localStroage: ref.read(localStorageProvider));
});

class FundRepository {
  DioClient _dioClient;
  LocalStorage _localStorage;
  FundRepository({required DioClient dioClient, required localStroage})
      : _dioClient = dioClient,
        _localStorage = localStroage;
  FutureEither<bool> initiatePaystack(
      {required BuildContext context,
      required String amount,
      required String url,
      required String email}) async {
    try {
      bool status = true;
      // PayWithPayStack().now(
      //     context: context,
      //     secretKey: Endpoints.paystackKey,
      //     customerEmail: email,
      //     reference: reference,
      //     callbackUrl: "setup in your paystack dashboard",
      //     currency: "NGN",
      //     amount: 2000,
      //     transactionCompleted: () {
      //       print("Transaction Successful");
      //       status = true;
      //     },
      //     transactionNotCompleted: () {
      //       print("Transaction Not Successful!");
      //       status = false;
      //     });
      pushTo(
          context,
          WebViewScreen(
            url: url,
            title: 'Payment',
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text('Done', style: AppTextStyle.secBtnStyle))
            ],
          ));
      return right(status);
    } on DioError catch (e) {
      return left(Failure(DioError(
          requestOptions:
              RequestOptions(path: '', data: {'message': 'Payment Fail'}))));
    }
  }

  FutureEither<FundModel> initiatTransaction(
      {required String pin, required String amount}) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.post(Endpoints.initateFund,
          data: {"amount": amount, "transaction_pin": pin},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return right(FundModel.fromJson(res.data['data']));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureVoid verifyTransaction(String reference) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      log('transaction ref $reference');
      final res = await _dioClient.post(Endpoints.verifyFunding,
          data: {"reference": reference},
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json'
          }));
      print(res.data);
      return right('');
    } on DioError catch (e) {
      print('error $e');
      return left(Failure(e));
    }
  }
}
