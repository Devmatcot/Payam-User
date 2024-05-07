import '../../../packages.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
      alignment: Alignment.center,
      child: LottiesWidget(
        name: 'loading',
      ),
    ));
  }
}


class SmallProgress extends StatelessWidget {
  const SmallProgress({
    this.color = AppColors.primary,
    Key? key,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.h,
      margin: EdgeInsets.all(10).r,
      child: CircularProgressIndicator(
        // backgroundColor: AppColors.black25,
        color: color,
        strokeWidth: 2,
      ),
    );
  }
}
// com.estatenew.app