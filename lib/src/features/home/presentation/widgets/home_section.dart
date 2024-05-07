import '../../../../../packages.dart';
import '../../controller/home_controller.dart';

class HomeSection extends ConsumerWidget {
  const HomeSection({
    required this.sec,
    super.key,
  });
  final Section sec;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(homeControllerProvider.notifier).updateSection(sec);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30).r,
          decoration: BoxDecoration(
              border: Border.all(
                  color: ref.watch(homeControllerProvider) == sec
                      ? AppColors.primary
                      : AppColors.gray),
              color: ref.watch(homeControllerProvider) == sec
                  ? AppColors.primary
                  : AppColors.white,
              borderRadius: BorderRadius.circular(10).r),
          child: Center(
            child: Text(
              sec.name,
              style: AppTextStyle.bodyText1.copyWith(
                  color: ref.watch(homeControllerProvider) == sec
                      ? AppColors.white
                      : AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
