import 'package:timeago/timeago.dart' as time;

import '../../model/chat_inbox.dart';
// import '../views/chat_room_screen.dart';
import '/packages.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    required this.isRead,
    required this.inbox,
    super.key,
  });

  final InboxList inbox;
  final bool isRead;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // pushTo(
        //     context,
        //     ChatRoomScreen(
        //       inbox: inbox,
        //     ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  offset: Offset(0, 2),
                  color: AppColors.greyLight)
            ],
            borderRadius: BorderRadius.circular(10).r),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5).r,
        child: Row(
          children: [
            Stack(
              children: [
                inbox.receiverProfileImage == ''
                    ? CircleAvatar(
                        backgroundColor: AppColors.gray,
                        radius: 30.h,
                        backgroundImage: AssetImage('assets/images/avater.png'),
                      )
                    : CircleAvatar(
                        backgroundColor: AppColors.gray,
                        radius: 30.h,
                        backgroundImage:
                            NetworkImage(inbox.receiverProfileImage),
                      ),
                Positioned(
                  bottom: 3.h,
                  right: 5.w,
                  child: CircleAvatar(
                    radius: 5.h,
                    backgroundColor: AppColors.transparent,
                    // backgroundColor:
                    //     index % 2 == 0 ? AppColors.grey : AppColors.green,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                // color: AppColors.appBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 'Ngozi Adamu',
                            inbox.receiverName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.bodyText1
                                .copyWith(fontWeight: AppFontWeight.medium),
                          ),
                          // 5.0.spacingH,
                          Text(
                            // 'I will like us to visit the site and check the surrounding of the building also',
                            inbox.lastMessage, maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.bodyText3
                                .copyWith(fontWeight: AppFontWeight.medium),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          // '${index + 1}min ago',
                          // inbox.time.toIso8601String(),
                          time.format(
                            inbox.time,
                          ),
                          style: AppTextStyle.bodyText4
                              .copyWith(fontWeight: AppFontWeight.medium),
                        ),
                        5.0.spacingH,
                        CircleAvatar(
                          radius: 10.r,
                          child: isRead ? null : Text('1'),
                          backgroundColor:
                              isRead ? AppColors.transparent : Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
