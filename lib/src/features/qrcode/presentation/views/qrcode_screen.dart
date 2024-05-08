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

  MobileScannerController controller = MobileScannerController();
  String? qrjsonCode;
  bool switchCreateQr = false;
  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
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
                          style: AppTextStyle.headline2.copyWith(fontSize: 24),
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
                                          data:
                                              '{"account":"1122334455",amount:"550"}',
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
                                        type: TextInputType.number),
                                    20.0.spacingH,
                                    AppTextField(
                                        title: 'Description',
                                        hint: 'e.g food',
                                        type: TextInputType.number),
                                    100.0.spacingH,
                                    LoadingButton(
                                        onPressed: () {
                                          setState(() {
                                            switchCreateQr = !switchCreateQr;
                                          });
                                        },
                                        child: Text(
                                          'Create QR Code',
                                          style: AppTextStyle.pryBtnStyle,
                                        ))
                                  ],
                                ),
                        ),
                        20.0.spacingH,
                      ],
                    ),
                  ),
                  Visibility(
                    visible: ref.watch(qrEnumProvider) != QRCodeEnum.create,
                    child: qrjsonCode != null
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
                                        data: 'Adedamola Sijuade Olaitan',
                                        title: 'Account name'),
                                    ConfirmDetails(
                                        data: '0011223344',
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
                                  type: TextInputType.number),
                              20.0.spacingH,
                              AppTextField(
                                  title: 'Description',
                                  hint: 'e.g food',
                                  type: TextInputType.number),
                              30.0.spacingH,
                              LoadingButton(
                                  onPressed: () {},
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
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20).r),
                                height: 450.h,
                                width: double.infinity,
                                child: MobileScanner(
                                    fit: BoxFit.cover,
                                    controller: controller,
                                    onDetect: (capture) {
                                      final List<Barcode> barcodes =
                                          capture.barcodes;
                                      final Uint8List? image = capture.image;
                                      for (final barcode in barcodes) {
                                        debugPrint(
                                            'Barcode found! ${barcode.rawValue}');
                                        controller.dispose();
                                        setState(() {
                                          qrjsonCode = barcode.rawValue;
                                        });
                                      }
                                    })),
                          ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
