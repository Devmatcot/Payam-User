import 'package:payam_user/src/features/transfer/model/beneficiary_model.dart';

import '../../../../../packages.dart';

class CustomListTile extends StatelessWidget {
  final Color? conColor;
  final Color? svgColor;
  final String title;
  final String subTitle;
  final String icons;
  final Widget? page;
  const CustomListTile({
    Key? key,
    this.conColor,
    this.svgColor,
    this.page,
    required this.title,
    required this.icons,
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
        padding: EdgeInsets.all(20).r,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 50.h,
              decoration: BoxDecoration(
                  color: conColor, borderRadius: BorderRadius.circular(5).r),
              padding: EdgeInsets.all(10).r,
              child: SvgWidget(icons, color: svgColor),
            ),
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

//Ride Tile
class RideListTile extends StatelessWidget {
  final String title;
  final String icons;
  final Widget? page;
  const RideListTile({
    Key? key,
    this.page,
    required this.title,
    required this.icons,
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
        padding: EdgeInsets.all(20).r,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
        child: Row(
          children: [
            SvgWidget(icons),
            10.0.spacingW,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.formTextNaturalR,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class AcctListTile extends StatelessWidget {
  final BeneficiaryModel? model;
  // final String subTitle;

  final Widget? page;
  const AcctListTile({
    Key? key,
    this.page,
    required this.model,
    // required this.subTitle,
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
            CachedNetworkImage(
              imageUrl:
                  'https://ui-avatars.com/api/?name=M+E&color=7F9CF5&background=EBF4FF',
              imageBuilder: (context, imageProvider) =>
                  CircleAvatar(radius: 30.h, backgroundImage: imageProvider),
              placeholder: (context, url) => CircleAvatar(
                  radius: 30.h,
                  backgroundImage: AssetImage(
                      'assets/images/${AssetConstants.profile}.png')),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 30.h,
                backgroundImage:
                    AssetImage('assets/images/${AssetConstants.profile}.png'),
              ),
            ),
            10.0.spacingW,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model?.accountName}',
                  style: AppTextStyle.formTextNaturalR,
                ),
                Text(
                  model?.accountNumber.substring(3) ?? "",
                  style: AppTextStyle.formTextNatural.copyWith(fontSize: 12),
                )
              ],
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primary,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
