import 'package:payam_user/src/features/transfer/model/beneficiary_model.dart';

import '../../../../../packages.dart';

class BankBeneListTile extends StatelessWidget {
  final String title;
  final String subTitle;

  final Widget? page;
  const BankBeneListTile({
    Key? key,
    this.page,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          pushTo(context, page!);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10).r,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.h,
              backgroundImage:
                  AssetImage('assets/images/${AssetConstants.profile}.png'),
            ),
            // Container(
            //   height: 50.h,
            //   width: 50.h,
            //   decoration: BoxDecoration(
            //       color: conColor, borderRadius: BorderRadius.circular(5).r),
            //   padding: EdgeInsets.all(10).r,
            //   child: SvgWidget(
            //       // AssetConstants.smalllogo,
            //       icons),
            // ),
            10.0.spacingW,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.formTextNaturalR,
                ),
                Text(
                  subTitle,
                  style: AppTextStyle.formTextNatural.copyWith(fontSize: 12),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class BeneListTile extends StatelessWidget {
  final BeneficiaryModel data;

  final Widget? page;
  const BeneListTile({
    Key? key,
    this.page,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          pushTo(context, page!);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10).r,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.h,
              backgroundColor: AppColors.black25,
              child: data.profilePhotoPath == null
                  ? Text(
                      '${data.accountName.split(' ').first.split('').first}${data.accountName.split(' ').last.split('').first}')
                  : null,
              backgroundImage: data.profilePhotoPath != null
                  ? NetworkImage(data.profilePhotoPath)
                  : null,
            ),
            10.0.spacingW,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.accountName,
                  style: AppTextStyle.formTextNaturalR,
                ),
                Text(
                  data.accountNumber.substring(3),
                  style: AppTextStyle.formTextNatural.copyWith(fontSize: 12),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
