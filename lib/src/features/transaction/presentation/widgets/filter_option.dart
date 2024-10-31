
import 'package:payam_user/packages.dart';

class FilterOptions extends StatelessWidget {
  final String title;
  const FilterOptions({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
          color: AppColors.primary.withOpacity(0.1)),
      child: Text(
        title,
        style: AppTextStyle.bodyText4.copyWith(color: AppColors.primary),
      ),
    );
  }
}