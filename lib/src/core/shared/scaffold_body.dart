import '../../../packages.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  final Widget? subWidget;
  final String title;
  final String subTitle;
  final double? padding;

  const ScaffoldBody(
      {super.key,
      required this.child,
      required this.title,
      this.padding,
      this.subWidget,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8).r,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.greyLight),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  20.0.spacingH,
                  Text(
                    title,
                    style: AppTextStyle.headline3.copyWith(fontSize: 25.sp),
                  ),
                  5.0.spacingH,
                  Text(
                    subTitle,
                    style: AppTextStyle.formTextNatural,
                  ),
                  subWidget ?? 20.0.spacingH,
                ],
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}

class ScaffoldBodyScroll extends StatelessWidget {
  final Widget child;
  final String title;
  final String subTitle;
  final double? padding;

  const ScaffoldBodyScroll(
      {super.key,
      required this.child,
      required this.title,
      this.padding,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24).r.copyWith(top: 24).r,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8).r,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.greyLight),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    20.0.spacingH,
                    Text(
                      title,
                      style: AppTextStyle.headline3.copyWith(fontSize: 25.sp),
                    ),
                    5.0.spacingH,
                    Text(
                      subTitle,
                      style: AppTextStyle.formTextNatural,
                    ),
                    20.0.spacingH,
                  ],
                ),
                child
              ],
            ),
          ),
        ),
      ),
    );
  }
}
