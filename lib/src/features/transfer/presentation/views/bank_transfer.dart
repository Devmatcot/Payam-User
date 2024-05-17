import '../../../../../packages.dart';

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
            hint: 'Phone No/Payam Tag/Email',
            type: TextInputType.text,
            title: 'Enter customer info',
          ),
          10.0.spacingH,
          CustomDropDown(
            itemsList:
                'Access Bank,GT Bank,Polaris,Sky Bank,Union Bank,Opay,Bellbank'
                    .split(','),
            hintText: '',
            firstItem: 'Access Bank',
            onChange: (value) {},
            title: 'Select Bank',
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
