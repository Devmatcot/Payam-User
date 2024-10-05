import '../../../../../packages.dart';
import '../../../../core/shared/app_dropdown.dart';

class BankTransferScreen extends ConsumerWidget {
  BankTransferScreen({super.key});
  final List iconList = [
    AssetConstants.gtblogo,
    AssetConstants.accesslogo,
    AssetConstants.fcmblogo,
    AssetConstants.fidelitylogo,
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Transfer to Other Banks',
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        children: [
          10.0.spacingH,
          AppTextField(
            hint: 'Enter 10 digit account number',
            type: TextInputType.number,
            maxLenth: 10,
            title: 'Enter account number',
          ),
          10.0.spacingH,
          AppTextField(
            hint: 'Select Bank',
            type: TextInputType.none,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => Scaffold(
                        backgroundColor: AppColors.transparent,
                        body: AppCustomDropDown(
                            title: 'Select Bank',
                            height: 700,
                            iconList: [],
                            itemList:
                                'Access Bank,GT Bank,Polaris,Sky Bank,Union Bank,Opay,Bellbank'
                                    .split(',')),
                      ));
            },
            title: 'Select biller',
            readOnly: true,
            surfixIcons: Icon(Icons.keyboard_arrow_down),
          ),
          20.0.spacingH,
          Text(
            'Recent Beneficiaries',
            style: AppTextStyle.formTextNaturalR,
          ),
          10.0.spacingH,
          ...List.generate(
              iconList.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 5.0).r,
                  child: CustomListTile(
                      icons: iconList[index],
                      title: 'Regina Adesewa',
                      subTitle:
                          '${iconList[index].toString().split('_').first.toTitleCase()} Bank - 8100112233'))),
          10.0.spacingH,
        ],
      ),
      // subTitle: '',
    );
  }
}
