import '/packages.dart';

// import 'package:test_project/src/core/utils/extension/widget_extensions.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final String? title;
  final bool fill;
  final bool obscured;
  final bool? readOnly;
  final int? maxLines;
  final bool isAmount;
  final TextStyle? hintStyle;
  final TextInputType type;
  final Color? fillColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final Widget? prefixIcons;
  final List<TextInputFormatter>? formeter;
  final Widget? surfixIcons;
  final int? maxLenth;
  final FocusNode? focusNode;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final double borRadius;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.hint,
    this.prefixIcons,
    this.surfixIcons,
    this.isAmount = false,
    this.formeter,
    this.maxLines = 1,
    this.controller,
    this.maxLenth,
    this.hintStyle,
    this.borderColor,
    this.style,
    this.borRadius = 12,
    this.fill = false,
    this.onEditingComplete,
    this.focusNode,
    this.readOnly = false,
    this.isPassword = false,
    this.obscured = false,
    this.fillColor,
    this.contentPadding,
    this.validator,
    this.onChange,
    this.onSubmitted,
    required this.type,
    this.title,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.primary,
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title ?? '',
              style: AppTextStyle.caption.copyWith(
                  fontWeight: AppFontWeight.regular, color: AppColors.natural),
            ),
          if (widget.title != null) 5.0.spacingH,
          TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onSubmitted,
            onEditingComplete: widget.onEditingComplete,
            maxLines: widget.maxLines,
            onChanged: widget.onChange,
            validator: widget.validator,
            inputFormatters: widget.formeter,
            maxLength: widget.maxLenth,
            style: widget.style ??
                AppTextStyle.headline3.copyWith(
                    color: AppColors.black, fontWeight: AppFontWeight.regular),
            cursorColor: AppColors.primaryDeep,
            obscureText: widget.isPassword ? !isVisible : widget.obscured,
            keyboardType: widget.type,
            readOnly: widget.readOnly!,
            decoration: AppTextFieldDecoration(),
          ),
        ],
      ),
    );
  }

  InputDecoration AppTextFieldDecoration() {
    double radius = widget.borRadius;
    return InputDecoration(
      hintText: widget.hint,
      hintStyle: widget.hintStyle ??
          AppTextStyle.formText.copyWith(fontWeight: AppFontWeight.regular),
      counterText: "",
      filled: widget.fill,
      prefixText: widget.isAmount ? '₦' : null,
      prefixStyle: TextStyle(
          fontFamily: 'Arial', fontWeight: AppFontWeight.medium, fontSize: 18),
      prefixIcon: widget.prefixIcons,
      fillColor: widget.fillColor ?? AppColors.gray,
      suffixIcon: widget.isPassword
          ? InkWell(
              child: Icon(isVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            )
          : widget.surfixIcons,
      contentPadding: widget.contentPadding ??
          const EdgeInsets.all(15).copyWith(left: 15).r,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius).r),
        borderSide: BorderSide(color: Colors.black, width: 0.8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius).r),
        borderSide: BorderSide(
          width: !widget.fill ? 0.8 : 0.8,
          color: !widget.fill
              ? AppColors.primaryDeep
              : widget.borderColor ?? AppColors.greyBlack,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius).r,
        borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.black25,
            width: widget.fill ? 0.8 : 0.8),
      ),
    );
  }
}
