
import '../../../../../packages.dart';
import '../../controller/search_controller.dart';

class WrapOption extends ConsumerWidget {
  const WrapOption({
    super.key,
    required this.model,
    required this.title,
    // required this.onTap
  });

  final List<OptionModel> model;
  final String title;
  // final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? option = ref.watch(searchControlProvider)?.name;
    String? option2 = ref.watch(listingOptionProvider)?.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.0.spacingH,
        Text(
          title,
          style: AppTextStyle.bodyText1
              .copyWith(fontWeight: AppFontWeight.semiBold),
        ),
        10.0.spacingH,
        Wrap(
          children: [
            ...List.generate(
              model.length,
              (index) => OptionButton(
                  model: model[index],
                  option: title.contains('Pro') ? option : option2,
                  onTap: () {
                    if (title.contains('Pro')) {
                      ref
                          .read(searchControlProvider.notifier)
                          .updatePropertiesModel(model[index]);
                    } else {
                      print('acton');
                      ref
                          .read(searchControlProvider.notifier)
                          .updateLsitingModel(model[index]);
                    }
                  }),
            )
          ],
        )
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.model,
    required this.option,
    required this.onTap,
  });

  final OptionModel model;
  final String? option;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0).copyWith(right: 8).r,
        child: Container(
          padding: EdgeInsets.all(15).r,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10).r,
              color: option == model.name ? AppColors.primary : AppColors.grey),
          child: Center(
            child: FittedBox(
              child: Text(
                model.name,
                style: AppTextStyle.bodyText4.copyWith(
                    color: option == model.name
                        ? AppColors.white
                        : AppColors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
