import 'package:payam_user/src/features/transfer/model/bank_model.dart';

import '../../../../../packages.dart';
import '../../../../core/shared/app_dropdown.dart';

class BankTransferScreen extends ConsumerStatefulWidget {
  BankTransferScreen({super.key});

  @override
  ConsumerState<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends ConsumerState<BankTransferScreen> {
  final List iconList = [
    AssetConstants.gtblogo,
    AssetConstants.accesslogo,
    AssetConstants.fcmblogo,
    AssetConstants.fidelitylogo,
  ];

  TextEditingController bankNameController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  List<BankModel> suggetedBank = [];

  getBankSuggestion() async {
    try {
      suggetedBank = [];
      isLoading = true;
      setState(() {});

      final data = await ref
          .read(transferConProvider.notifier)
          .getBankSugList(_controller.text);
      if (data.isNotEmpty) {
        isLoading = false;
        suggetedBank = data;
        setState(() {});
      }
      isLoading = false;
      setState(() {});
    } catch (e) {
      suggetedBank = [];
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.invalidate(payamBeneProvider);
    });
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _controller.text.length == 10) {
        getBankSuggestion();
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bankData = ref.watch(bankListProvider);
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
            title: 'Enter Account Number',
            formeter: [],
            controller: _controller,
            focusNode: _focusNode,
            onChange: (value) {
              if (value.length == 10) {
                _focusNode.unfocus();
                // getBankSuggestion();
              }
            },
            surfixIcons: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? SmallProgress()
                  : InkWell(
                      onTap: () {
                        if (_focusNode.hasFocus) {
                          _controller.clear();
                        }
                      },
                      child: Icon(Icons.cancel),
                    ),
            ),
          ),
          10.0.spacingH,
          Offstage(
            offstage: suggetedBank.isEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bank Suggestion',
                  style: AppTextStyle.formTextNaturalR,
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      suggetedBank.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0)
                            .r
                            .copyWith(right: 10)
                            .r,
                        child: Container(
                          padding: EdgeInsets.all(10).r,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10).r),
                          child: Row(
                            children: [
                              Container(
                                height: 50.h,
                                width: 50.h,
                                decoration: BoxDecoration(
                                    color: AppColors.gray,
                                    image: DecorationImage(
                                        image: NetworkImage(suggetedBank[index]
                                                .image
                                                .contains('svg')
                                            ? Endpoints.defaultBankImg
                                            : suggetedBank[index].image)),
                                    borderRadius: BorderRadius.circular(5).r),
                                padding: EdgeInsets.all(10).r,
                                // child: SvgWidget(iconList.first),
                              ),
                              10.0.spacingW,
                              Text(
                                suggetedBank[index].name,
                                style: AppTextStyle.formTextNaturalR,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AppTextField(
                  hint: 'Select Bank',
                  type: TextInputType.none,
                  controller: bankNameController,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => Scaffold(
                              backgroundColor: AppColors.transparent,
                              body: AppCustomDropDown(
                                  title: 'Select Bank',
                                  height: 700,
                                  onTap: (value) {
                                    bankNameController.text = value;
                                  },
                                  iconList: bankData.hasValue
                                      ? bankData.value!
                                          .map((e) => e.image)
                                          .toList()
                                      : [],
                                  itemList: bankData.hasValue
                                      ? bankData.value!
                                          .map((e) => e.name)
                                          .toList()
                                      : []
                                  // 'Access Bank,GT Bank,Polaris,Sky Bank,Union Bank,Opay,Bellbank'
                                  //     .split(',')

                                  ),
                            ));
                  },
                  title: 'Select bank',
                  readOnly: true,
                  surfixIcons: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ref.watch(bankListProvider).isLoading
                          ? SmallProgress()
                          : Icon(Icons.keyboard_arrow_down)),
                ),
              ],
            ),
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
          30.0.spacingH
        ],
      ),
      // subTitle: '',
    );
  }
}
