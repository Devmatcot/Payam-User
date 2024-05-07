import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../controller/chat_controller.dart';
import '../model/chat_inbox.dart';
import '../model/chat_model.dart';
import '/packages.dart';

final chatRepoProvider = Provider<ChatRepository>((ref) {
  ChatRepository chatRepo = ChatRepository(
    dioClient: ref.read(dioClientProvider),
    ref: ref,
    localStorage: ref.read(localStorageProvider),
  );
  ref.onDispose(() {
    print('i am dispose');
    chatRepo.closeSocket();
  });
  return chatRepo;
});

class ChatRepository {
  DioClient _dioClient;
  LocalStorage _localStorage;
  Ref _ref;
  late WebSocketChannel _channel;

  ChatRepository(
      {required DioClient dioClient,
      required LocalStorage localStorage,
      required Ref ref})
      : _localStorage = localStorage,
        _ref = ref,
        _dioClient = dioClient;

  initialized(String receiverId, String senderId) async {
    try {
      print('i am intialized here');

      // String accessToken = await _localStorage.get(Endpoints.access_token);
      final wsUrl = Uri.parse(Endpoints.chatSocketURL(receiverId, senderId));
      _channel = WebSocketChannel.connect(wsUrl);
      // print(_channel.cast());
      _channel.stream.listen((event) {
        Map<String, dynamic> jsonMap = json.decode(event);
        print(jsonMap);
        if (jsonMap.containsKey('id')) {
          ChatModel newChat = ChatModel.fromJson(jsonMap);
          _ref
              .read(allChatProvider.notifier)
              .update((state) => [...state, newChat]);
        }
      });
    } on WebSocketException catch (e) {
      print('socket exception${e.message}');
    }
  }

  sendMessage(String text) {
    print('send message to event');
    _channel.sink.add(jsonEncode({'text': text}));
  }

  Stream<dynamic> get stream => _channel.stream;

  FutureEither<ChatInbox> allMessage() async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allMessage,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      return right(ChatInbox.fromJson(res.data['data']));
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  FutureEither<List<ChatModel>> getRoomMessage(String roomId) async {
    try {
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.allRoomMessage(roomId),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      print(res);
      List allChat = res.data['data']['messages'];
      return right(allChat.map((e) => ChatModel.fromJson(e)).toList());
    } on DioError catch (e) {
      return left(Failure(e));
    }
  }

  closeSocket() {
    _channel.sink.close();
    _channel.sink.close();
    print('socket connection close');
  }

  FutureVoid checkCoin(String agentId) async {
    try {
      print(agentId + 'agent id');
      String accessToken = await _localStorage.get(Endpoints.access_token);
      final res = await _dioClient.get(
        Endpoints.checkChatCoin(agentId),
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      print(res.data.toString());
      return right(null);
    } on DioError catch (e) {
      print(e.response?.requestOptions.uri);
      return left(Failure(e));
    }
  }
}
