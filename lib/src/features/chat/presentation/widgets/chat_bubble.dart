import '../../../../../packages.dart';
import '../../model/chat_model.dart';

class ChatBubble extends ConsumerWidget {
  ChatBubble({super.key, required this.chat, required this.index});

  final ChatModel chat;
  final int index;
  final Radius radius = Radius.circular(30);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userModelProvider);
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // if (index % 2 == 0) Spacer(),
        if (user.userId == chat.senderId) Spacer(),
        if (user.userId != chat.senderId)
          // if (index % 2 != 0)
          Row(
            children: [
              CircleAvatar(
                radius: 20.h,
                backgroundColor: AppColors.gray,
                backgroundImage: AssetImage('assets/images/avater.png'),
              ),
              10.0.spacingW,
            ],
          ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
          decoration: BoxDecoration(
              color: user.userId == chat.senderId
                  ? AppColors.primary
                  : AppColors.grey,
              // color: index % 2 == 0 ? AppColors.primary : AppColors.grey,
              borderRadius: BorderRadius.only(
                      bottomRight:
                          user.userId != chat.senderId ? radius : Radius.zero,
                      // bottomRight: index % 2 != 0 ? radius : Radius.zero,
                      topLeft: radius,
                      bottomLeft:
                          user.userId == chat.senderId ? radius : Radius.zero,
                      // bottomLeft: index % 2 == 0 ? radius : Radius.zero,
                      topRight: radius)
                  .r),
          constraints: BoxConstraints(
            maxWidth: width75 + width180,
          ),
          child: Text(
            chat.text.toString(),
            style: AppTextStyle.bodyText1.copyWith(
                fontSize: 14,
                color: user.userId == chat.senderId
                    ? AppColors.white
                    : AppColors.black
                // color: index % 2 == 0 ? AppColors.white : AppColors.black
                ),
          ),
        ),
        if (user.userId == chat.senderId)
          // if (index % 2 == 0)
          Row(
            children: [
              10.0.spacingW,
              CircleAvatar(
                radius: 20.h,
                backgroundColor: AppColors.gray,
                backgroundImage: AssetImage('assets/images/avater.png'),
              ),
            ],
          ),
      ],
    );
  }
}
