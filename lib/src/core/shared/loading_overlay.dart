import 'package:loading_overlay/loading_overlay.dart';

import '../../../packages.dart';
import 'loading_indicator.dart';

class LoadingOverlayer extends StatelessWidget {
  const LoadingOverlayer(
      {required this.isLoading, required this.child, super.key});
  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      color: AppColors.black25,
      progressIndicator: LoadingIndicator(),
      child: child,
    );
  }
}
