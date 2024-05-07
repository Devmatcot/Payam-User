// import '../../coin/presentation/widgets/no_coin_alert.dart';
import '../model/chat_inbox.dart';
import '../model/chat_model.dart';
import '/packages.dart';
// import '/src/features/chat/presentation/views/chat_room_screen.dart';
import '/src/features/chat/repository/chat_repo.dart';

final chatControlerProvider =
    StateNotifierProvider<ChatController, bool>((ref) {
  ref.onDispose(() {
    print('chat dispose');
    ref.read(chatRepoProvider).closeSocket();
  });
  return ChatController(chatRepository: ref.watch(chatRepoProvider), ref: ref);
});
// final allMessageProvider = FutureProvider((ref) async {
//   return ref.watch(chatControlerProvider.notifier).allMessage();
// });

// final allChatMessageProvider =
//     FutureProvider.family<List<ChatModel>, String>((ref, roomId) async {
//   return ref.watch(chatControlerProvider.notifier).getRoomMessage(roomId);
// });

final allChatProvider = StateProvider<List<ChatModel>>((ref) {
  return [];
});

class ChatController extends StateNotifier<bool> {
  ChatRepository _chatRepository;
  Ref _ref;
  ChatController({required ChatRepository chatRepository, required Ref ref})
      : _chatRepository = chatRepository,
        _ref = ref,
        super(false);

  // Future<ChatInbox?> allMessage() async {
  //   final res = await _chatRepository.allMessage();
  //   return res.fold((l) {
  //     AppConfig.handleErrorMessage(l.error);
  //     return null;
  //   }, (r) {
  //     return r;
  //   });
  // }

  // initailized(String receiverId, String senderId) async {
  //   await _chatRepository.initialized(receiverId, senderId);
  //   await getRoomMessage(receiverId);
  // }

  // closeSocket() {
  //   print('socket close');
  //   _chatRepository.closeSocket();
  // }

  // Future<List<ChatModel>> getRoomMessage(String roomId) async {
  //   state = true;
  //   final res = await _chatRepository.getRoomMessage(roomId);
  //   return res.fold((l) {
  //     state = false;
  //     AppConfig.handleErrorMessage(l.error);
  //     return [];
  //   }, (allmessage) {
  //     state = false;
  //     _ref.read(allChatProvider.notifier).update((state) => allmessage);
  //     print('current state is $state');
  //     return allmessage;
  //   });
  // }

  // sendMessage(String text) {
  //   _chatRepository.sendMessage(text);
  // }

  // checkCoin(
  //   BuildContext context,
  //   String agentId,
  //   agentName,
  // ) async {
  //   state = true;
  //   final res = await _chatRepository.checkCoin(agentId);
  //   res.fold((l) {
  //     state = false;

  //     if (l.error.response?.statusCode == 417) {
  //       generalDialogBox(context, NoCoinAlert());
  //     } else {
  //       AppConfig.handleErrorMessage(l.error);
  //     }
  //   }, (r) {
  //     state = false;
  //     pushToFirst(
  //         context,
  //         ChatRoomScreen(
  //             inbox: InboxList(
  //                 id: '',
  //                 receiverId: agentId,
  //                 receiverName: agentName,
  //                 receiverProfileImage: '',
  //                 lastMessage: '',
  //                 time: DateTime.now())));
  //   });
  // }
}
