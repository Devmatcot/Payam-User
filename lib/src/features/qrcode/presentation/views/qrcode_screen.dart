import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:payam_user/src/core/utils/extension/money_formeter.dart';
import 'package:payam_user/src/features/transfer/controller/transfer_controller.dart';

import '../../../../../packages.dart';
import '../../controller/escrow_controller.dart';

class QrCodeScreen extends ConsumerStatefulWidget {
  const QrCodeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends ConsumerState<QrCodeScreen> {
  changePostion(QRCodeEnum currentValue) {
    ref.read(qrEnumProvider.notifier).update((state) => currentValue);
  }

  bool isLoading = false;
  getDetail(String phone) async {
    print('$phone');
    payamDetail = null;
    isLoading = true;
    final data = await ref
        .read(transferChangeProvider.notifier)
        .currentUser(phone.substring(3));
    if (data != null) {
      isLoading = false;
      payamDetail = data;
    }
    isLoading = false;
    setState(() {});
  }

  UserModel? payamDetail;
  MobileScannerController controller = MobileScannerController();
  Map qrjsonCode = {};
  String encodeQrcode = '';
  String newAmount = '';
  bool switchCreateQr = false;
  TextEditingController _amountCon = TextEditingController();
  TextEditingController _descriptionCon = TextEditingController();
  TextEditingController _scanAmountCon = TextEditingController();
  TextEditingController _scanDescriptionCon = TextEditingController();

  String generateQrData(String phone, String type) {
    String staticQrData = jsonEncode({
      'amount': _amountCon.text,
      'fromUser': phone,
      'note': _descriptionCon.text,
      'url': 'payam.ng',
      'type': 'hard'
    });
    String customeQrData = jsonEncode({
      'amount': '0.00',
      'fromUser': phone,
      'note': _descriptionCon.text,
      'url': 'payam.ng',
      'type': 'free'
    });
    encodeQrcode = type.contains('static') ? staticQrData : customeQrData;
    return encodeQrcode;
  }

  @override
  void initState() {
    qrjsonCode = {};
    encodeQrcode = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = ref.watch(userModelProvider)!;
    return LoadingOverlayer(
      isLoading: ref.watch(transferConProvider) || isLoading,
      child: OverlayWidget(
        title: 'Scan to Pay',
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40).r,
                child: Container(
                  padding: EdgeInsets.all(3).r,
                  decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(30).r),
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        margin: ref.watch(qrEnumProvider) == QRCodeEnum.create
                            ? EdgeInsets.only(left: 160).r
                            : EdgeInsets.only(right: 160).r,
                        child: Text(
                          '   ',
                          style: AppTextStyle.bodyText4,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.black25),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30).r),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 15).r,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              changePostion(QRCodeEnum.scan);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15)
                                  .r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30).r),
                              child: Text(
                                'Scan to Pay',
                                style: AppTextStyle.bodyText4,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              changePostion(QRCodeEnum.create);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15)
                                  .r,
                              decoration: BoxDecoration(
                                  // color: AppColors.white,
                                  borderRadius: BorderRadius.circular(30).r),
                              child: Text(
                                'Create QR Code',
                                style: AppTextStyle.bodyText4,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20).r,
                child: Column(
                  children: [
                    Visibility(
                      visible: ref.watch(qrEnumProvider) == QRCodeEnum.create,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Request for Payment',
                            style:
                                AppTextStyle.headline2.copyWith(fontSize: 24),
                          ),
                          40.0.spacingH,
                          AnimatedSwitcher(
                            duration: Duration(seconds: 3),
                            switchInCurve: Curves.easeIn,
                            switchOutCurve: Curves.easeInOut,
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  child: child, scale: animation);
                            },
                            child: switchCreateQr
                                ? Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          padding: EdgeInsets.all(10).r,
                                          height: 350.h,
                                          width: 350.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20).r,
                                              border: Border.all(
                                                  color: AppColors.primary,
                                                  width: 1)),
                                          child: QrImageView(
                                            // backgroundColor: AppColors.appBlue,
                                            dataModuleStyle: QrDataModuleStyle(
                                                color: AppColors.primaryDeep,
                                                dataModuleShape:
                                                    QrDataModuleShape.square),
                                            eyeStyle: QrEyeStyle(
                                                color: AppColors.primaryDeep,
                                                eyeShape: QrEyeShape.square),
                                            data: encodeQrcode,
                                            version: QrVersions.auto,
                                          ),
                                        ),
                                      ),
                                      20.0.spacingH,
                                      LoadingButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Share QR Code',
                                            style: AppTextStyle.pryBtnStyle,
                                          )),
                                      20.0.spacingH,
                                      SecondaryButton(
                                          onTap: () {
                                            setState(() {
                                              switchCreateQr = !switchCreateQr;
                                            });
                                          },
                                          child: Text(
                                            'Generate new QR Code',
                                            style: AppTextStyle.secBtnStyle,
                                          ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      AppTextField(
                                        isAmount: true,
                                        title: 'Amount',
                                        hint: '100.00 - 2,000,000.00',
                                        controller: _amountCon,
                                        type: TextInputType.numberWithOptions(
                                            decimal: true),
                                        formeter: [
                                          DecimalFormatter(),
                                        ],
                                        onChange: (value) {
                                          newAmount = value.replaceAll(
                                              RegExp(r','), '');
                                        },
                                        validator: (p0) {
                                          if (_amountCon.text.isEmpty) {
                                            return 'Provide specific amount';
                                          }
                                          return null;
                                        },
                                      ),
                                      20.0.spacingH,
                                      AppTextField(
                                          title: 'Description',
                                          hint: 'e.g food',
                                          controller: _descriptionCon,
                                          type: TextInputType.text),
                                      50.0.spacingH,
                                      ValueListenableBuilder(
                                        valueListenable: _amountCon,
                                        builder: (context, value, child) {
                                          bool isEnable =
                                              _amountCon.text.isNotEmpty;
                                          return LoadingButton(
                                              onPressed: isEnable
                                                  ? () {
                                                      generateQrData(
                                                          userModel.phoneNumber,
                                                          'static');
                                                      setState(() {
                                                        switchCreateQr =
                                                            !switchCreateQr;
                                                      });
                                                    }
                                                  : null,
                                              child: Text(
                                                'Create QR Code',
                                                style: AppTextStyle.pryBtnStyle,
                                              ));
                                        },
                                      ),
                                      20.0.spacingH,
                                      SecondaryButton(
                                          onTap: () {
                                            setState(() {
                                              switchCreateQr = !switchCreateQr;
                                              generateQrData(
                                                  userModel.phoneNumber,
                                                  'dynamic');
                                            });
                                          },
                                          child: Text('Create dynamic QR Code',
                                              style: AppTextStyle.secBtnStyle))
                                    ],
                                  ),
                          ),
                          20.0.spacingH,
                        ],
                      ),
                    ),
                    Visibility(
                      visible: ref.watch(qrEnumProvider) != QRCodeEnum.create,
                      child: qrjsonCode.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sending to',
                                  style: AppTextStyle.formTextNatural,
                                ),
                                10.0.spacingH,
                                Container(
                                  padding: EdgeInsets.all(10).r,
                                  child: Column(
                                    children: [
                                      ConfirmDetails(
                                          isName: true,
                                          data:
                                              "${payamDetail?.firstName} ${payamDetail?.lastName}",
                                          title: 'Account name'),
                                      ConfirmDetails(
                                          data: payamDetail?.phoneNumber
                                                  .substring(3) ??
                                              '',
                                          title: 'Account number')
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10).r,
                                      color: AppColors.white),
                                ),
                                20.0.spacingH,
                                AppTextField(
                                  isAmount: true,
                                  title: 'Amount',
                                  hint: '100.00 - 2,000,000.00',
                                  readOnly: qrjsonCode['type'] != 'free',
                                  controller: _scanAmountCon,
                                  type: TextInputType.numberWithOptions(
                                      decimal: true),
                                  formeter: [
                                    DecimalFormatter(),
                                  ],
                                  onChange: (value) {
                                    newAmount =
                                        value.replaceAll(RegExp(r','), '');
                                  },
                                  validator: (p0) {
                                    if (_scanAmountCon.text.isEmpty) {
                                      return 'Provide specific amount';
                                    }
                                    return null;
                                  },
                                ),
                                20.0.spacingH,
                                AppTextField(
                                    title: 'Description',
                                    hint: 'e.g food',
                                    controller: _scanDescriptionCon,
                                    type: TextInputType.number),
                                30.0.spacingH,
                                LoadingButton(
                                    onPressed: payamDetail != null
                                        ? () {
                                            bottomSheet(
                                                context,
                                                ConfirmQrCodeTransaction(
                                                    acctName:
                                                        '${payamDetail!.firstName} ${payamDetail!.lastName}',
                                                    acctNo: payamDetail!
                                                        .phoneNumber
                                                        .substring(3),
                                                    amount: newAmount,
                                                    ctx: context,
                                                    note: _scanDescriptionCon
                                                        .text));
                                          }
                                        : null,
                                    child: Text(
                                      'Proceed',
                                      style: AppTextStyle.pryBtnStyle,
                                    )),
                                // 20.0.spacingH,
                                // SecondaryButton(
                                //     onTap: () {
                                //       setState(() {
                                //         qrjsonCode = null;
                                //         controller.dispose();
                                //       });
                                //     },
                                //     child: Text(
                                //       'Rescan Qr Code',
                                //       style: AppTextStyle.secBtnStyle,
                                //     )),
                                50.0.spacingH,
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20).r,
                              child: Stack(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20).r),
                                      height: 450.h,
                                      width: double.infinity,
                                      child: MobileScanner(
                                          fit: BoxFit.cover,
                                          controller: controller,
                                          onDetect: (capture) async {
                                            final List<Barcode> barcodes =
                                                capture.barcodes;
                                            String scanCode = '';
                                            final Uint8List? image =
                                                capture.image;
                                            for (final barcode in barcodes) {
                                              scanCode = barcode.rawValue ?? '';
                                            }

                                            if (scanCode.contains('payam')) {
                                              controller.dispose();
                                              setState(() {
                                                qrjsonCode =
                                                    jsonDecode(scanCode);
                                              });
                                              print('qr code $qrjsonCode');

                                              _scanAmountCon.text =
                                                  qrjsonCode['amount'];
                                              _scanDescriptionCon.text =
                                                  qrjsonCode['note'];
                                              await getDetail(
                                                  qrjsonCode['fromUser']
                                                      .toString());

                                              //
                                            } else {
                                              qrjsonCode = {};
                                              AppConfig.showToast(
                                                  'Invalid Qr Code, try again',
                                                  AppColors.redLight);
                                              // pop(context);
                                            }
                                          })),
                                  if (isLoading)
                                    Container(
                                      width: double.infinity,
                                      height: 450.h,
                                      color: AppColors.black54,
                                      child: CupertinoActivityIndicator(
                                          radius: 30, color: AppColors.white),
                                    )
                                ],
                              ),
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
