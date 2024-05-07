import 'dart:io';

import '../../../../../packages.dart';
import '../../../property/controller/properties_controller.dart';

class PropertyMemImage extends ConsumerWidget {
  const PropertyMemImage(
      {super.key,
      required this.imagePath,
      required this.index,
      required this.onTap,
      required this.total});

  final String imagePath;
  final int index;
  final int total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        onTap();
        ref.read(selectedImageProvider.notifier).update((state) {
          state.removeAt(index);
          return state;
        });
      },
      child: Stack(
        children: [
          Container(
            height: 75.h,
            width: 75.h,
            child: index == 2 && total > 3
                ? Container(
                    child: Center(
                      child: Text(
                        '+${total - 3}',
                        style: AppTextStyle.headline1
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    color: AppColors.primary.withOpacity(0.7),
                  )
                : null,
            decoration: BoxDecoration(
                color: AppColors.gray,
                image: DecorationImage(
                    image: FileImage(
                      File(imagePath),
                    ),
                    fit: BoxFit.cover)),
          ),
          Icon(
            Icons.cancel,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}







class AddPropertyImage extends ConsumerWidget {
 final double height;
 final double width;
  const AddPropertyImage({
    this.height=75,
    this.width=75,
    required this.onTap,
    super.key,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
        radius: const Radius.circular(7).r,
        borderType: BorderType.RRect,
        color: AppColors.appDark,
        dashPattern: [5, 5, 5],
        child: Container(
          height: height.h,
          width: width.h,
          color: AppColors.white,
          child: Center(
            child: Icon(
              Icons.add,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
