import '../../../../../packages.dart';

class CustomListTile extends StatelessWidget {
  final Color? conColor;
  final String title;
  final String subTitle;
  final String icons;
  final Widget? page;
  const CustomListTile({
    Key? key,
    this.conColor,
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
              child: SvgWidget(
                  // AssetConstants.smalllogo,
                  icons),
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

class BeneListTile extends StatelessWidget {
 
  final String title;
  final String subTitle;

  final Widget? page;
  const BeneListTile({
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
