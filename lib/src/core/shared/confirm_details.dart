import '../../../packages.dart';

class ConfirmDetails extends StatelessWidget {
  const ConfirmDetails({
    required this.data,
    required this.title,
    this.color,
    this.width,
    this.isAmount,
    this.isName = false,
    this.visible = true,
    super.key,
  });
  final String title;
  final String data;
  final bool? isAmount;
  final Color? color;
  final bool isName;
  final bool visible;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0).r,
        // padding: const EdgeInsets.only(top: 8.0).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.bodyText5
                  .copyWith(fontWeight: AppFontWeight.regular),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isAmount != null)
                  NairaText(
                    fontSize: 17,
                  ),
                1.0.spacingW,
                Container(
                  width: isName ? width ?? width180 : null,
                  child: Text(
                    data,
                    textAlign: TextAlign.end,
                    style: AppTextStyle.bodyText5M.copyWith(color: color),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
