// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:payam_user/packages.dart';
import 'package:payam_user/src/features/settings/presentation/views/edit_email.dart';

class ProfileDetailsScreen extends ConsumerWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelProvider);

    return OverlayWidget(
      title: 'My Account',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20).r),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.h,
                    backgroundColor: AppColors.gray,
                  ),
                  // 20.0.spacingH,
                  ProfileTile(
                    title: 'Full Name',
                    data: '${userModel?.firstName} ${userModel?.lastName}',
                  ),
                  ProfileTile(
                    title: 'Phone Number',
                    data: '+${userModel?.phoneNumber}',
                  ),
                  ProfileTile(
                    title: 'Email Address',
                    isEdited: true,
                    data: '${userModel?.email}',
                  ),
                  ProfileTile(
                    title: 'Date of Birth',
                    data: '${userModel?.dateOfBirth.toSplashFormRe()}',
                  ),
                  ProfileTile(
                    title: 'Gender',
                    data: '${userModel?.gender.toTitleCase()}',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String data;
  final bool isEdited;
  ProfileTile({
    Key? key,
    required this.title,
    required this.data,
    this.isEdited = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0).r,
      child: GestureDetector(
        onTap: () {
          if (isEdited) {
            pushTo(context, EditEmailScreen());
          }
        },
        child: Container(
          color: AppColors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, //  'Name',
                    style: AppTextStyle.subtitle1,
                  ),
                  Text(
                    data, //'Dev Matcot',
                    style: AppTextStyle.formTextS,
                  )
                ],
              ),
              isEdited ? SvgWidget(AssetConstants.edit) : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
