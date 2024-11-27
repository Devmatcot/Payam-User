import 'package:payam_user/src/core/shared/app_dropdown.dart';
import 'package:payam_user/src/features/utility/model/data_plans.dart';

import '../../../../../packages.dart';

class DataScreen extends ConsumerWidget {
  DataScreen({super.key});
  List constAmount = [
    '1GB - 250',
    '2GB - 380',
    '5GB - 540',
    '10GB - 650',
  ];
  String newAmount = '';
  // List constNetwork = ['MTN', 'Glo', 'Airtel', '9mobile'];

  List<DataPlans> dataPlans = [
    DataPlans(
        id: 9,
        billerCode: 'billerCode',
        name: 'name',
        defaultCommission: 12,
        dateAdded: DateTime.now(),
        country: 'country',
        isAirtime: false,
        billerName: 'MTN 50MB',
        itemCode: 'itemCode',
        shortName: 'shortName',
        fee: 9,
        commissionOnFee: true,
        regExpression: 'regExpression',
        labelName: 'labelName',
        amount: 60,
        isResolvable: true,
        groupName: 'groupName',
        categoryName: 'categoryName',
        isData: true,
        defaultCommissionOnAmount: 'defaultCommissionOnAmount',
        commissionOnFeeOrAmount: 'commissionOnFeeOrAmount',
        validityPeriod: '7')
  ];
  String selectNetWork = '';
  TextEditingController _phoneNoCtr = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userBalance = ref.watch(userModelProvider)?.balance ?? '0';
    // List<DataPlans> dataPlans = ref.watch(dataPlansPro());
    return OverlayWidget(
      title: 'Purchase Data',
      child: ListView(
        padding: EdgeInsets.all(20).r,
        children: [
          AppTextField(
            hint: 'e.g 08011223344',
            type: TextInputType.phone,
            title: 'Enter phone number',
            formeter: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value!.length > 11) {
                return 'Number must not be more than 11';
              } else if (!value.isValidPhone) {
                return 'Provide valid phone number';
              } else if (value.isEmpty) {
                return 'Phone number is required';
              } else {}
              return null;
            },
            controller: _phoneNoCtr,
            surfixIcons: Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: SvgWidget(AssetConstants.contact),
            ),
          ),
          20.0.spacingH,
          Text(
            'Select Network',
            style: AppTextStyle.headline5
                .copyWith(fontWeight: AppFontWeight.regular),
          ),
          5.0.spacingH,
          GridView.builder(
            shrinkWrap: true,
            itemCount: ref
                    .watch(getAirtimeBiller(Endpoints.dataBiller))
                    .value
                    ?.length ??
                4,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.h,
                mainAxisSpacing: 10.h,
                childAspectRatio: 10 / 10,
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              selectNetWork = ref.watch(netWorkSelectProvider);

              return ref.watch(getAirtimeBiller(Endpoints.dataBiller)).when(
                  skipLoadingOnRefresh: false,
                  data: (data) {
                    return InkWell(
                      onTap: () {
                        ref.invalidate(dataPlansPro);
                        ref
                            .read(netWorkSelectProvider.notifier)
                            .update((state) => data[index].billerCode);
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30).r,
                                child: ImageWidget(data[index]
                                    .name
                                    .split(' ')
                                    .first
                                    .toString()
                                    .toLowerCase())),
                            3.0.spacingH,
                            Text(
                              data[index].name.split(' ').first.toString(),
                              style: AppTextStyle.bodyText4,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.gray.withOpacity(0.6),
                            border: Border.all(
                                color: selectNetWork == data[index].billerCode
                                    ? AppColors.primary
                                    : AppColors.transparent),
                            borderRadius: BorderRadius.circular(10).r),
                      ),
                    );
                  },
                  error: (e, s) => ShimmerOverlay(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.circular(10).r),
                        ),
                      ),
                  loading: () => ShimmerOverlay(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.gray,
                              borderRadius: BorderRadius.circular(10).r),
                        ),
                      ));
            },
          ),
          20.0.spacingH,
          ref.watch(dataPlansPro(selectNetWork)).when(
                data: (data) {
                  return AppTextField(
                    hint: 'Select Biller ${selectNetWork}',
                    type: TextInputType.text,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => Scaffold(
                                backgroundColor: AppColors.transparent,
                                body: AppCustomDropDown(
                                    onTap: (value) {},
                                    iconList: [],
                                    title: 'Select Biller',
                                    itemList: data
                                        .map((e) =>
                                            '${e.billerName} - ${e.validityPeriod}Days')
                                        .toList()),
                              ));
                    },
                    title: 'Select biller',
                    readOnly: true,
                    surfixIcons:
                        ref.watch(dataPlansPro(selectNetWork)).isLoading
                            ? SmallProgress()
                            : Icon(Icons.keyboard_arrow_down),
                  );
                },
                error: (e, s) => Text(e.toString()),
                loading: () => AppTextField(
                  hint: 'Select Biller ${selectNetWork}',
                  type: TextInputType.text,
                  onTap: () {},
                  title: 'Select biller',
                  readOnly: true,
                  surfixIcons: ref.watch(dataPlansPro(selectNetWork)).isLoading
                      ? SmallProgress()
                      : Icon(Icons.keyboard_arrow_down),
                ),
              ),
          // AppTextField(
          //   hint: 'Select Biller ${selectNetWork}',
          //   type: TextInputType.text,
          //   onTap: () {
          //     showDialog(
          //         context: context,
          //         builder: (context) => Scaffold(
          //               backgroundColor: AppColors.transparent,
          //               body: AppCustomDropDown(
          //                   onTap: (value) {},
          //                   iconList: [],
          //                   title: 'Select Biller',
          //                   itemList: ref
          //                           .watch(dataPlansPro(selectNetWork))
          //                           .value
          //                           ?.map((e) =>
          //                               '${e.billerName} - ${e.validityPeriod}Days')
          //                           .toList() ??
          //                       []),
          //             ));
          //   },
          //   title: 'Select biller',
          //   readOnly: true,
          //   surfixIcons: ref.watch(dataPlansPro(selectNetWork)).isLoading
          //       ? SmallProgress()
          //       : Icon(Icons.keyboard_arrow_down),
          // ),
          20.0.spacingH,
          AppTextField(
            hint: '100 - 10,000',
            type: TextInputType.numberWithOptions(decimal: true),
            title: 'Enter Amount',
            isAmount: true,
            readOnly: true,
            controller: _amountController,
            formeter: [
              DecimalFormatter(),
            ],
            onChange: (value) {
              newAmount = value.replaceAll(RegExp(r','), '');
              ref.read(airtimeAmountProvider.notifier).update((state) => '');
              // setState(() {
              //   _key.currentState?.validate();
              // });
            },
            validator: (p0) {
              if (newAmount != "") {
                if ((double.tryParse(newAmount) ?? 0) >
                    double.parse(userBalance)) {
                  return 'Insufficient fund';
                } else if ((double.tryParse(newAmount) ?? 0) <= 49.99) {
                  return 'Enter N50 and above';
                } else if ((double.tryParse(newAmount) ?? 0) ==
                    double.parse(userBalance)) {
                  return null;
                }
              } else if (_amountController.text.isEmpty) {
                return 'Provide specific amount';
              }
              return null;
            },
          ),
          30.0.spacingH,
          ListenableBuilder(
            listenable: Listenable.merge([_amountController, _phoneNoCtr]),
            builder: (context, child) {
              bool isEnable = _amountController.text.isNotEmpty &&
                  _phoneNoCtr.text.isValidPhone;
              return LoadingButton(
                  onPressed: isEnable
                      ? () {
                          bottomSheet(
                              context,
                              ConfirmAirtimeTransaction(
                                  biller: selectNetWork,
                                  phoneNumber: _phoneNoCtr.text,
                                  amount: newAmount,
                                  ctx: context));
                        }
                      : null,
                  child: Text(
                    'Proceed',
                    style: AppTextStyle.pryBtnStyle,
                  ));
            },
          ),
          30.0.spacingH,
        ],
      ),
    );
  }
}
