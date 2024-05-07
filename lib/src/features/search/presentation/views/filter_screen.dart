import '../widgets/amount_range.dart';
import '../widgets/wrap_option.dart';
import '/packages.dart';
import '/src/features/search/controller/search_controller.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  double startval = 0.2, endval = 0.5;

  @override
  Widget build(BuildContext context) {
    return OverlayWidget(
      title: 'Search Filter',
      // bgColor: AppColors.scaffoldColor,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20).r,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgWidget(
                    AssetConstants.location,
                    height: 30.h,
                    color: AppColors.primary,
                  ),
                  20.0.spacingW,
                  Text(
                    'Select Location',
                    style: AppTextStyle.caption
                        .copyWith(fontWeight: AppFontWeight.semiBold),
                  )
                ],
              ),
              SvgWidget(AssetConstants.arrow_right)
            ],
          ),
          20.0.spacingH,
          Text(
            'Price Range:',
            style: AppTextStyle.bodyText1
                .copyWith(fontWeight: AppFontWeight.semiBold),
          ),
          10.0.spacingH,
          Row(
            children: [
              20.0.spacingW,
              AmountRange(),
              10.0.spacingW,
              Text(
                'To',
                style: AppTextStyle.caption.copyWith(color: AppColors.primary),
              ),
              10.0.spacingW,
              AmountRange(),
              20.0.spacingW,
            ],
          ),
          RangeSlider(
            //by default, min-max: 0-1
            inactiveColor: AppColors.grey,
            values: RangeValues(startval, endval),
            onChanged: (RangeValues value) {
              setState(() {
                startval = value.start;
                endval = value.end;
              });
            },
          ),
          WrapOption(
              model: ref.watch(searchControlProvider.notifier).propertiesType,
              title: 'Properties Type:'),
          WrapOption(
              model: ref.watch(searchControlProvider.notifier).listingType,
              title: 'Listing Type:'),
          20.0.spacingH,
          LoadingButton(
            onPressed: () {
              pop(context);
            },
            child: Text(
              'Apply',
              style: AppTextStyle.pryBtnStyle,
            ),
          ),
          20.0.spacingH,
          SecondaryButton(
            onTap: () {
              pop(context);
            },
            child: Text(
              'Cancel',
              style: AppTextStyle.secBtnStyle,
            ),
          )
        ],
      ),
    );
  }
}
