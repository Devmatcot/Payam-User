
import '../../../packages.dart';

class CustomRadio extends StatelessWidget {
  // final String title;
  final id;
  final initial;
  final VoidCallback onTap;
  const CustomRadio({
    required this.initial,
    required this.onTap,
    required this.id,
    // required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: id == initial
            ? const CircleAvatar(
                radius: 6,
                backgroundColor: AppColors.primary,
              )
            : const CircleAvatar(
                radius: 6,
                backgroundColor: Colors.transparent,
              ),
        padding: EdgeInsets.all(2).r,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color:
                    id == initial ? AppColors.primary : AppColors.primary)),
      ),
    );
  }
}
