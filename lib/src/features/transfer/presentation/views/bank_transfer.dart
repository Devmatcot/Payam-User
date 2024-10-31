import 'package:payam_user/src/features/transfer/model/bank_model.dart';
import 'package:payam_user/src/features/transfer/presentation/views/bank_amount.dart';

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
  BankModel? selectedBankModel;
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

  validateBankDetail(BankModel model) {
    ref.invalidate(bankValidateProvider);
    selectedBankModel = model;
    bankNameController.text = model.name;
    ref
        .read(transferConProvider.notifier)
        .validateBankDetail(_controller.text, selectedBankModel!.bankCode);
  }

  @override
  Widget build(BuildContext context) {
    final bankData = ref.watch(bankListProvider);
    final bankDetail = ref.watch(bankValidateProvider);
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
            formeter: [FilteringTextInputFormatter.digitsOnly],
            controller: _controller,
            focusNode: _focusNode,
            onChange: (value) {
              if (value.length == 10) {
                _focusNode.unfocus();
                // getBankSuggestion();
              }
              ref.invalidate(bankValidateProvider);

              suggetedBank.clear();
              setState(() {});
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
                        child: GestureDetector(
                          onTap: () {
                            // selectedBankModel = suggetedBank[index];
                            // bankNameController.text = suggetedBank[index].name;
                            // ref
                            //     .read(transferConProvider.notifier)
                            //     .validateBankDetail(_controller.text,
                            //         selectedBankModel!.bankCode);
                            validateBankDetail(suggetedBank[index]);
                          },
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
                                          image: NetworkImage(
                                              suggetedBank[index]
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
                                    selectedBankModel = bankData.value!
                                        .firstWhere(
                                            (element) => element.name == value);
                                    // bankNameController.text = value;
                                    // ref
                                    //     .read(transferConProvider.notifier)
                                    //     .validateBankDetail(_controller.text,
                                    //         selectedBankModel!.bankCode);

                                    validateBankDetail(selectedBankModel!);
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
                                      : []),
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
          if (ref.watch(transferConProvider))
            ShimmerOverlay(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CustomListTile(
                    title: 'bankDetail.accountName',
                    icons: 'bank_logo',
                    subTitle:
                        '{bankDetail.accountNumber} - bankDetail.bankName'),
              ),
            ),
          if (bankDetail != null && !ref.watch(transferConProvider))
            Column(
              children: [
                20.0.spacingH,
                CustomListTile(
                    title: bankDetail.accountName,
                    icons: 'bank_logo',
                    subTitle:
                        '${bankDetail.accountNumber} - ${bankDetail.bankName}'),
                10.0.spacingH,
                LoadingButton(
                    onPressed: () {
                      pushTo(context, BankAmountScreen(model: bankDetail));
                    },
                    child: Text('Proceed', style: AppTextStyle.pryBtnStyle))
              ],
            ),
          20.0.spacingH,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          icons: 'bank_logo',
                          title: 'Regina Adesewa',
                          subTitle:
                              '${iconList[index].toString().split('_').first.toTitleCase()} Bank - 8100112233'))),
            ],
          ),
          30.0.spacingH
        ],
      ),
      // subTitle: '',
    );
  }
}
