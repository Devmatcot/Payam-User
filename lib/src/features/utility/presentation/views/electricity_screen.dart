import 'package:payam_user/src/core/shared/app_dropdown.dart';
import 'package:payam_user/src/features/utility/model/electricty_billers.dart';

import '../../../../../packages.dart';

class ElectricityScreen extends ConsumerWidget {
  ElectricityScreen({super.key});
  final TextEditingController _amountController = TextEditingController();
  String newAmount = '';
  List<ElectricityBiller> electricty = [
    ElectricityBiller(name: 'Ibadan Electricity IBEDC', img: 'img'),
    ElectricityBiller(name: 'Benin Electricity BEDC', img: 'img'),
    ElectricityBiller(name: 'Ikeja Electricity IKEDC', img: 'img'),
    ElectricityBiller(name: 'Jos Electricity JED', img: 'img'),
    ElectricityBiller(name: 'Kaduna Electricity KEDCO', img: 'img'),
    ElectricityBiller(name: 'Port Harcourt Electricity PHED', img: 'img'),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userBalance = ref.watch(userModelProvider)?.balance ?? '0';

    return OverlayWidget(
      title: 'Electricity',
      child: ListView(
        padding: EdgeInsets.all(20).r,
        children: [
          AppTextField(
            hint: 'Select Biller',
            type: TextInputType.text,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => Scaffold(
                        backgroundColor: AppColors.transparent,
                        body: AppCustomDropDown(
                            onTap: (value){},

                            iconList: [],
                            title: 'Select Biller',
                            itemList: electricty),
                      ));
            },
            title: 'Select biller',
            readOnly: true,
            surfixIcons: Icon(Icons.keyboard_arrow_down),
          ),
          15.0.spacingH,
          AppTextField(
            hint: 'Meter Number',
            type: TextInputType.number,
            title: 'Enter Meter No',
          ),
          10.0.spacingH,
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10).r,
            child: Text(
              'Matthew Olayemi Emmanuel',
              style: AppTextStyle.bodyText1.copyWith(color: AppColors.primary),
            ),
            decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(5).r),
          ),
          15.0.spacingH,
          AppTextField(
            hint: '100 - 10,000',
            type: TextInputType.numberWithOptions(decimal: true),
            title: 'Enter Amount',
            isAmount: true,
            controller: _amountController,
            formeter: [
              DecimalFormatter(),
            ],
            onChange: (value) {
              newAmount = value.replaceAll(RegExp(r','), '');
              // ref.read(airtimeAmountProvider.notifier).update((state) => '');
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
          20.0.spacingH,
          LoadingButton(
              child: Text(
            'Proceed',
            style: AppTextStyle.pryBtnStyle,
          ))
        ],
      ),
    );
  }
}
