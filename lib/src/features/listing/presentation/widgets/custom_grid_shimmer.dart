import 'package:shimmer/shimmer.dart';

import '../../../../../packages.dart';

class GridChildShimmer extends StatelessWidget {
  const GridChildShimmer({
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.gray,
                    child: Image.asset('assets/images/building.png',
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10.h,
                        width: double.infinity,
                        color: AppColors.appGrey,
                      ),
                      5.0.spacingH,
                      Container(
                        height: 5.h,
                        width: 50.w,
                        color: AppColors.appGrey,
                      ),
                      5.0.spacingH,
                      Container(
                        height: 10.h,
                        width: double.infinity,
                        color: AppColors.appGrey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
