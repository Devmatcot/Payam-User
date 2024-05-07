import '../../../../../packages.dart';
// import '../../../search/presentation/views/search_screen.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.hintText,
    this.controller,
    this.isNav = false,
    super.key,
  });
  final String hintText;
  final TextEditingController? controller;
  final bool isNav;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.bodyText1,
      controller: controller,
      textInputAction: TextInputAction.done,
      onSubmitted: (value) {
        if (isNav) {
          if (value.isNotEmpty) {
            // pushTo(
            //   context,
            //   SearchScreen(
            //     searchText: value,
            //   ),
            // );
          }
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.formText,
        contentPadding:
            EdgeInsets.symmetric(vertical: 15.r).copyWith(top: 15, right: 12).r,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15.0).r,
          child: SvgWidget(
            AssetConstants.search,
          ),
        ),
        fillColor: AppColors.white,
        isCollapsed: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10).r,
          borderSide: BorderSide(color: AppColors.gray),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10).r),
      ),
    );
  }
}
