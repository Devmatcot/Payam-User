import 'package:intl/intl.dart';

import '../../../../../packages.dart';
import '../../controller/noti_control.dart';
import '../../model/noti_model.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlayWidget(
      title: 'Notifications',
      child: ref.watch(allNotiProvider).when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 10).r,
                  child: Notiwidget(data: data[index]),
                ),
              );
            },
            error: (e, s) => Center(
              child: Text(e.toString()),
            ),
            loading: () => Center(
              child: SmallProgress(),
            ),
          ),
    );
  }
}

class Notiwidget extends StatelessWidget {
  final NotificationModel data;
  const Notiwidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10).r),
      padding: EdgeInsets.all(10).r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: SvgWidget(
              AssetConstants.notification,
              color: AppColors.appBlue,
            ),
            backgroundColor: AppColors.appBlue.withOpacity(0.1),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              // color: AppColors.appBlue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'New Message from Agent',
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bodyText2
                        .copyWith(fontWeight: AppFontWeight.medium),
                  ),
                  5.0.spacingH,
                  Text(
                    data.body,
                    // 'Your request for Escrow has been approve, continue chat with the agent to stay updated with latest information',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bodyText4
                        .copyWith(color: AppColors.appDark),
                  ),
                  5.0.spacingH,
                  Text(
                    DateFormat.yMMMEd().format(data.created),
                    style: AppTextStyle.bodyText4,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
