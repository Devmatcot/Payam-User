// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import '../../../packages.dart';

// final sockectProvider = Provider<SocketServiceRepository>((ref) {
//   return SocketServiceRepository();
// });

// class SocketService {
//   SocketService() {
//     // String url = Endpoints.sockectBaseURl('');
//     socket = IO.io(
//       'url',
//       IO.OptionBuilder().setTransports(['websocket']).build(),
//     );
//     socket.onConnect((_) {
//       print('socket connected');
//     });
//     socket.onError((data) => print('Socket error $data'));
//   }
//   static late IO.Socket socket;
// }

// class SocketServiceRepository {
//   IO.Socket? socket;

//   onIntiatlize(String url) {
//     socket = IO.io(url, <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//     });
//     socket!.connect();
//     socket!.onConnect((_) {
//       print('socket connected');
//     });
//     socket!.onError((data) => print('Sockect error $data'));
//   }
// }
