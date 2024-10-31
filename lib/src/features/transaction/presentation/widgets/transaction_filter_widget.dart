import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/transaction/presentation/widgets/filter_option.dart';

class TransactionFilterWidget extends StatelessWidget {
  const TransactionFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24).r,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20).r),
          margin: EdgeInsets.all(20).r,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filter Transaction',
                style: AppTextStyle.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                child: AppDivider(),
              ),
              Text(
                'Category',
                style: AppTextStyle.bodyText4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,

                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // runSpacing: 10,
                  spacing: 1,
                  children: [
                    FilterOptions(title: 'All Transaction'),
                    FilterOptions(title: 'Money Out'),
                    FilterOptions(title: 'Money In'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                child: AppDivider(),
              ),
              Text(
                'Status',
                style: AppTextStyle.bodyText4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                child: Wrap(
                  runSpacing: 5,
                  alignment: WrapAlignment.spaceEvenly,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterOptions(title: 'All'),
                    FilterOptions(title: 'Successful'),
                    FilterOptions(title: 'Pending'),
                    FilterOptions(title: 'Fail'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                child: AppDivider(),
              ),
              Text(
                'Date',
                style: AppTextStyle.bodyText4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: DatePicker(
                      padding: 10,
                      hintText: 'Start Date',
                    )),
                    10.0.spacingW,
                    Expanded(
                        child: DatePicker(
                      hintText: 'End Date',
                      padding: 10,
                    )),
                  ],
                ),
              ),
              20.0.spacingH,
              Row(
                children: [
                  Expanded(
                      child: SecondaryButtonWhite(
                    title: 'Cancel Filter',
                    onTap: () => pop(context),
                  )),
                  10.0.spacingW,
                  Expanded(
                      child: LoadingButton(
                          onPressed: () {},
                          child: Text('Apply Filter',
                              style: AppTextStyle.pryBtnStyle))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
