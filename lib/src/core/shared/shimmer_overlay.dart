
import 'package:shimmer/shimmer.dart';

import '../../../packages.dart';

class ShimmerOverlay extends ConsumerWidget {
final  Widget child;
  const ShimmerOverlay({
    required this.child,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.grey,
      child: child,);
  }
}