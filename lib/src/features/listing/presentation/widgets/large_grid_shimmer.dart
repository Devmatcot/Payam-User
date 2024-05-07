import 'package:shimmer/shimmer.dart';

import '../../../../../packages.dart';

class LargeGridChildShimmer extends StatelessWidget {
  const LargeGridChildShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: Shimmer.fromColors(
        baseColor: AppColors.gray,
        highlightColor: AppColors.grey,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10).r,
          child: Container(
            decoration: BoxDecoration(
                // color: AppColors.white,
                ),
            // height: 200.h,
            child: InkWell(
              onTap: () {
                // pushTo(context, PropertyDetails(propertiesId: ,));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.h,
                    color: AppColors.gray,
                    child: Image.asset('assets/images/building.png',
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '5 Bedroom Duplex Building',
                              style:
                                  AppTextStyle.bodyText1.copyWith(fontSize: 14),
                            ),
                            Text(
                              '#60,875,000',
                              style: AppTextStyle.bodyText1,
                            )
                          ],
                        ),
                        10.0.spacingH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fully Furnished, 100% Secure enviroment',
                              style: AppTextStyle.bodyText3,
                            ),
                            Text(
                              'Negotiable',
                              style: AppTextStyle.bodyText3.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: AppFontWeight.medium),
                            )
                          ],
                        ),
                        10.0.spacingH,
                        Row(
                          children: [
                            SvgWidget(AssetConstants.location),
                            5.0.spacingW,
                            Text('Lekki, Phase 1. Lagos .'),
                          ],
                        )
                        // Spacer(),
                      ],
                    ),
                  ),
                  5.0.spacingH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
