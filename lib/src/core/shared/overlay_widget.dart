import '../../../packages.dart';

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({
    required this.child,
    required this.title,
    this.bottomNav,
    this.onBack,
    this.bgColor,
    this.lead,
    super.key,
  });
  final Widget child;
  final Widget? bottomNav;
  final Widget? lead;
  final String title;
  final Color? bgColor;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: bottomNav,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              padding: EdgeInsets.all(20).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        pop(context);
                        if (onBack != null) {
                          onBack!();
                        }
                      },
                      child: SvgWidget(AssetConstants.arrowleft)),
                  // Spacer(),
                  Text(
                    // 'Nearby Listing',
                    title,
                    style: AppTextStyle.overline
                        .copyWith(fontWeight: AppFontWeight.semiBold),
                  ),
                  //
                  lead != null ? lead! : 30.0.spacingW,
                  // Spacer(),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
