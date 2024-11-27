import 'package:file_picker/file_picker.dart';

import '/packages.dart';
import '../../utility/repositiory/utility_repo.dart';
import '../repository/escrow_repository.dart';

final escrowControllerProvider =
    StateNotifierProvider<EscrowController, bool>((ref) {
  return EscrowController(
      propertiesRepository: ref.read(propertiesRepoProvider),
      escrowRepository: ref.read(escrowRepoProvider),
      ref: ref);
});

// final getAllEscrowProvider = FutureProvider<List<EscrowModel>>((ref) async {
//   return ref.read(escrowControllerProvider.notifier).getAllEscrowList();
// });
// final getEscrowByIdProvider =
//     FutureProvider.family<EscrowFullDetailModel, String>((ref, id) async {
//   return ref.read(escrowControllerProvider.notifier).getEscrowById(id);
// });

final qrEnumProvider = StateProvider<QRCodeEnum>((ref) {
  return QRCodeEnum.scan;
});
final proofImageProvider = StateProvider<FilePickerResult?>((ref) {
  return null;
});

class EscrowController extends StateNotifier<bool> {
  EscrowRepository _escrowRepository;
  utilityRepository _propertiesRepository;
  Ref _ref;
  EscrowController(
      {required EscrowRepository escrowRepository,
      required utilityRepository propertiesRepository,
      required Ref ref})
      : _escrowRepository = escrowRepository,
        _propertiesRepository = propertiesRepository,
        _ref = ref,
        super(false);
}
