import 'package:payam_user/src/features/transfer/model/beneficiary_model.dart';

import '../../../../../packages.dart';

class PayamTransferScreen extends ConsumerStatefulWidget {
  const PayamTransferScreen({super.key});

  @override
  ConsumerState<PayamTransferScreen> createState() =>
      _PayamTransferScreenState();
}

class _PayamTransferScreenState extends ConsumerState<PayamTransferScreen> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  getDetail() async {
    try {
      payamDetail = null;
      isLoading = true;
      final data = await ref
          .read(transferChangeProvider.notifier)
          .getPayamUser(_controller.text);
      if (data != null) {
        isLoading = false;
        payamDetail = data;
      }
      isLoading = false;
      setState(() {});
    } on DioError catch (e) {
      payamDetail = null;
      isLoading = false;
      setState(() {});
      AppConfig.showToast('User not found');
    }
  }

  BeneficiaryModel? payamDetail;

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.invalidate(payamBeneProvider);
    });
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _controller.text.length >= 5) {
        getDetail();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
      title: 'Transfer to Payam',
      child: RefreshIndicator(
        onRefresh: () => ref.refresh(payamBeneProvider.future),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          children: [
            10.0.spacingH,
            AppTextField(
              hint: 'Phone No e.g 7011223344',
              type: TextInputType.phone,
              title: 'Enter payam info',
              controller: _controller,
              maxLenth: 10,
              focusNode: _focusNode,
              onChange: (value) {
                payamDetail = null;
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
            Offstage(
                offstage: payamDetail == null,
                child: Column(
                  children: [
                    10.0.spacingH,
                    AcctListTile(
                      page: payamDetail != null
                          ? PayamAmountScreen(model: payamDetail!)
                          : null,
                      model: payamDetail,
                    ),
                  ],
                )),
            20.0.spacingH,
            Text(
              'Recent Beneficiaries',
              style: AppTextStyle.formTextNaturalR,
            ),
            10.0.spacingH,
            ref.watch(payamBeneProvider).when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  return data.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              30.0.spacingH,
                              SvgWidget(AssetConstants.noRecord),
                              Text('No Beneficiary',
                                  style: AppTextStyle.bodyText1),
                            ],
                          ),
                        )
                      : Column(
                          children: List.generate(data.length, (index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 5.0).r,
                                child: BeneListTile(
                                  page: PayamAmountScreen(model: data[index]),
                                  data: data[index],
                                ));
                          }),
                        );
                },
                error: (e, s) {
                  return Center(
                    child: Text(
                      'Error Occur',
                      style: AppTextStyle.bodyText1,
                    ),
                  );
                },
                loading: () => Center(child: SmallProgress())),
            10.0.spacingH,
          ],
        ),
      ),
      // subTitle: '',
    );
  }
}
