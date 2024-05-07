import '../../../packages.dart';

class TextCheckBox extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?)? onChanged;
  const TextCheckBox({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
            activeColor: AppColors.primary,
            // overlayColor: MaterialStatePropertyAll(AppColors.white),
            value: value,
            onChanged: onChanged),
        Text(
          title,
          style: AppTextStyle.bodyText1,
        )
      ],
    );
  }
}

class OptionCheckBox extends StatefulWidget {
  final String title;
  final dynamic myId;
  final dynamic groupId;
  final Function(bool?)? onChanged;
  const OptionCheckBox({
    required this.title,
    required this.myId,
    required this.groupId,
    required this.onChanged,
    super.key,
  });

  @override
  State<OptionCheckBox> createState() => _OptionCheckBoxState();
}

class _OptionCheckBoxState extends State<OptionCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          activeColor: AppColors.primary,
          // overlayColor: MaterialStatePropertyAll(AppColors.white),
          value: isChecked,
          onChanged: (value) {
            isChecked = value!;
            setState(() {});
            widget.onChanged!(value);
          },
        ),
        Text(
          widget.title,
          style: AppTextStyle.bodyText1,
        )
      ],
    );
  }
}
