import '/packages.dart';

final datePickerProvider = StateProvider<DateTime?>((ref) {
  return null;
});

class DatePicker extends ConsumerStatefulWidget {
  final DateTime? date;
  final DateTime? lastDate;
  final String? title;
  final String? hintText;
  final double? padding;
  const DatePicker({
    this.title,
    this.date,
    this.hintText,
    this.padding,
    this.lastDate,
    super.key,
  });

  @override
  ConsumerState<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends ConsumerState<DatePicker> {
  @override
  void initState() {
    if (widget.date != null) {
      date = widget.date;
    }
    super.initState();
  }

  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title ?? '',
            style: AppTextStyle.caption.copyWith(
                fontWeight: AppFontWeight.regular, color: AppColors.natural),
          ),
        if (widget.title != null) 5.0.spacingH,
        InkWell(
          onTap: () async {
            try {
              DateTime? result = await showDatePicker(
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: AppColors.primary, // header background color
                          onPrimary: AppColors.white, // header text color
                          onSurface: Colors.black, // body text color
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                AppColors.primary, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                  firstDate: DateTime(1900),
                  initialDate: DateTime.now(),
                  lastDate: widget.lastDate ?? DateTime.now(),
                  context: context);
              if (result != null) {
                setState(() {
                  date = result;
                  ref
                      .read(datePickerProvider.notifier)
                      .update((state) => result);
                });
              }
              // print(result);
            } catch (e) {}
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: widget.padding ?? 20)
                .r
                .copyWith(left: 10, right: 20)
                .r,
            decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(color: AppColors.black54, width: 0.5)),
            child: Row(
              children: [
                // SvgWidget(
                //     AssetConstants.calender),
                // Icon(Icons.arrow_drop_down),
                // Container(
                //   height: 30,
                //   width: 1,
                //   color: AppColors.gray,
                // ),
                5.0.spacingW,
                if (date == null)
                  Text(
                    widget.hintText ?? '01/01/1900',
                    style: AppTextStyle.formText,
                  ),
                if (date != null)
                  Text(
                    '${date!.day}/${date!.month}/${date!.year}',
                    style: AppTextStyle.bodyText1,
                  ),
                Spacer(),
                SvgWidget(AssetConstants.calender),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
