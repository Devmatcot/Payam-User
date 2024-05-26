
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
  List constNetwork = ['MTN', 'Glo', 'Airtel', '9mobile'];
  String selectNetWork = '';
  TextEditingController _phoneNoCtr = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userBalance = ref.watch(userModelProvider)?.balance ?? '0';
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
            itemCount: constNetwork.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.h,
                mainAxisSpacing: 10.h,
                childAspectRatio: 10 / 10,
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              selectNetWork = ref.watch(netWorkSelectProvider);
              bool netWorkTap = selectNetWork == constNetwork[index];
              return InkWell(
                onTap: () {
                  ref
                      .read(netWorkSelectProvider.notifier)
                      .update((state) => constNetwork[index]);
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30).r,
                          child: ImageWidget(
                              constNetwork[index].toString().toLowerCase())),
                      3.0.spacingH,
                      Text(
                        constNetwork[index].toString(),
                        style: AppTextStyle.bodyText4,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.gray.withOpacity(0.6),
                      border: Border.all(
                          color: netWorkTap
                              ? AppColors.primary
                              : AppColors.transparent),
                      borderRadius: BorderRadius.circular(10).r),
                ),
              );
            },
          ),
          20.0.spacingH,
          Text(
            'Select Plans',
            style: AppTextStyle.headline5
                .copyWith(fontWeight: AppFontWeight.regular),
          ),
          10.0.spacingH,
          GridView.builder(
            shrinkWrap: true,
            itemCount: constAmount.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.h,
                mainAxisSpacing: 10.h,
                childAspectRatio: 18 / 10,
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              return Consumer(builder: (context, myRef, child) {
                String selectedAmount = myRef.watch(airtimeAmountProvider);
                bool isSelect = selectedAmount == constAmount[index];
                return InkWell(
                  onTap: () async {
                    newAmount = myRef
                        .read(airtimeAmountProvider.notifier)
                        .update((state) => constAmount[index]);
                    // openBottomSheet();
                    // _amountController.text = newAmount;
                  },
                  child: Container(
                    padding: EdgeInsets.all(5).r,
                    decoration: BoxDecoration(
                        color: AppColors.gray.withOpacity(0.6),
                        border: Border.all(
                            color: isSelect
                                ? AppColors.primary
                                : AppColors.transparent),
                        borderRadius: BorderRadius.circular(5).r),
                    child: FittedBox(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              constAmount[index].toString().split('-').first +
                                  ' - ',
                              style: AppTextStyle.bodyText3,
                            ),
                            Text(
                              AssetConstants.nairaSymbol,
                              style: TextStyle(
                                  fontFamily: 'Ariel',
                                  fontSize: 11,
                                  color: AppColors.natural,
                                  fontWeight: AppFontWeight.regular),
                            ),
                            // 2.0.spacingW,
                            Text(
                              constAmount[index].toString().split('-').last,
                              style: AppTextStyle.bodyText3,
                            ),
                            // 2.0.spacingW,
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
          20.0.spacingH,
          AppTextField(
            hint: '100 - 10,000',
            type: TextInputType.numberWithOptions(decimal: true),
            title: 'or Enter Amount',
            isAmount: true,
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
