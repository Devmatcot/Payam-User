import 'package:file_picker/file_picker.dart';

// import '../../coin/presentation/widgets/no_coin_alert.dart';
import '../../home/controller/home_controller.dart';
import '../../jobs/model/job_type.dart';
// import '../../jobs/presentation/views/create_job.dart';

// import '../presentation/views/create_property_list.dart';
import '/packages.dart';
import '/src/features/auth/model/acct_enum.dart';
import '/src/features/property/repositiory/properties_repo.dart';
// import 'add_property_control.dart';

final favoriteProvider = StateProvider<bool>((ref) {
  return false;
});
final selectedImageProvider = StateProvider<List<PlatformFile>>((ref) {
  return [];
});
final propertiesControllerProvider =
    StateNotifierProvider<PropertiesController, bool>((ref) {
  return PropertiesController(
      propertiesRepository: ref.watch(propertiesRepoProvider), ref: ref);
});
final propertiesLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

// final allWatchListProvider = FutureProvider((ref) async {
//   return ref
//       .read(propertiesControllerProvider.notifier)
//       .getAllWatchListProperties();
// });

// final allAgentProperties = FutureProvider((ref) async {
//   return ref.read(propertiesControllerProvider.notifier).getAgentProperties();
// });

// final getPropertiesbyIdProvider =
//     FutureProvider.family<PropertiesDetailsModel?, String>((ref, pro) async {
//   print(pro + ' Proper');
//   final properties = await ref
//       .watch(propertiesControllerProvider.notifier)
//       .getPropertiesById(pro);
//   ref.read(favoriteProvider.notifier).update(
//         (state) => properties?.isWatchlisted ?? false,
//       );
//   return properties;
// });

// final getAgentPropertiesbyIdProvider =
//     FutureProvider.family<PropertiesDetailsModel, String>((ref, pro) async {
//   return ref
//       .watch(propertiesControllerProvider.notifier)
//       .getAgentPropertiesById(pro);
// });

final allProTypeProvider = FutureProvider<List<OptionsType>>((ref) async {
  final res =
      await ref.read(propertiesControllerProvider.notifier).getProType();
  ref.read(proTypeListProvider.notifier).update((state) {
    state.addAll(res);
    return state;
  });
  return res;
});
final allProConProvider = FutureProvider<List<OptionsType>>((ref) async {
  final res =
      await ref.read(propertiesControllerProvider.notifier).getCondType();
  ref.read(proConListProvider.notifier).update((state) {
    state.addAll(res);
    return state;
  });
  return res;
});

final allProResProvider = FutureProvider<List<OptionsType>>((ref) async {
  final res =
      await ref.read(propertiesControllerProvider.notifier).getResType();
  ref.read(proResListProvider.notifier).update((state) {
    state.addAll(res);
    return state;
  });
  return res;
});
final proTypeListProvider = StateProvider<List<OptionsType>>((ref) {
  List<OptionsType> proType = [
    OptionsType(
      id: '001',
      name: 'Select Property type',
    )
  ];

  return proType;
});

final coinNotifier = StateProvider<bool>((ref) {
  return false;
});

final proConListProvider = StateProvider<List<OptionsType>>((ref) {
  List<OptionsType> proType = [
    OptionsType(
      id: '001',
      name: 'Select Property Condition',
    )
  ];
  return proType;
});

final proResListProvider = StateProvider<List<OptionsType>>((ref) {
  List<OptionsType> proType = [
    OptionsType(
      id: '001',
      name: 'Select Resident type',
    )
  ];
  return proType;
});

// final homeProvider = FutureProvider<HomeFeedProperties>((ref) async {
//   return ref.read(propertiesControllerProvider.notifier).getNewHomeDetails();
// });

// final allApplianceProvider = FutureProvider<List<OptionsType>>((ref) async {
//   return ref.read(propertiesControllerProvider.notifier).getAllAppliance();
// });

class PropertiesController extends StateNotifier<bool> {
  PropertiesRepository _propertiesRepository;
  Ref _ref;

  PropertiesController(
      {required PropertiesRepository propertiesRepository, required Ref ref})
      : _propertiesRepository = propertiesRepository,
        _ref = ref,
        super(true) {
    if (_ref.watch(acctTypeProvider) != AccountType.agent) {
      print('loading home for user');
      // getHomeDetails();
    }
  }

  updateState(bool value) {
    state = value;
  }

  // Future<HomeFeedProperties> getNewHomeDetails() async {
  //   state = true;
  //   final res = await _propertiesRepository.getHomeDetails();
  //   return res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) => r);
  // }

  // Future<PropertiesDetailsModel?> getPropertiesById(String id) async {
  //   final res = await _propertiesRepository.getPropertiesById(id);
  //   return res.fold((dio) {
  //     AppConfig.handleErrorMessage(dio.error);
  //     return null;
  //   }, (model) {
  //     return model;
  //   });
  // }

  // Future<PropertiesDetailsModel> getAgentPropertiesById(String id) async {
  //   final res = await _propertiesRepository.getAgentPropertiesById(id);
  //   return res.fold((dio) => AppConfig.handleErrorMessage(dio.error), (model) {
  //     return model;
  //   });
  // }

  changeFavorite(String propertiesId) async {
    bool favoriteState = _ref.read(favoriteProvider);
    _ref.read(favoriteProvider.notifier).update((state) => !state);
    final res = await _propertiesRepository.addPropertiesToWatchList(
        propertiesId, favoriteState);
    res.fold(
        (l) => AppConfig.handleErrorMessage(l.error),
        (r) => AppConfig.showToast(favoriteState
            ? 'Properties Removed from Watchlists'
            : 'Properties Added to Watchlists'));
  }

  // Future<List<Listing>> getAllWatchListProperties() async {
  //   final res = await _propertiesRepository.getAllWatchListProperties();
  //   return res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) => r);
  // }

  // Future<List<OptionsType>> getAllAppliance() async {
  //   final res = await _propertiesRepository.getAllAppliance();
  //   return res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) => r);
  // }

  // Future<List<AgentProperty>> getAgentProperties() async {
  //   final res = await _propertiesRepository.getAgentProperties();
  //   return res.fold((l) => AppConfig.handleErrorMessage(l.error), (r) => r);
  // }

  pickImage() async {
    final res = await _propertiesRepository.pickImage();
    if (res?.files != null) {
      _ref.read(selectedImageProvider.notifier).update((state) {
        state.addAll(res!.files);
        return state;
      });
      _ref.read(selectedImageProvider);
      print(_ref.read(selectedImageProvider).length);
    } else {}
  }

  Future<List<OptionsType>> getProType() async {
    final res = await _propertiesRepository.getPropertType();
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (data) => data);
  }

  Future<List<OptionsType>> getResType() async {
    final res = await _propertiesRepository.getResType();
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (data) => data);
  }

  Future<List<OptionsType>> getCondType() async {
    final res = await _propertiesRepository.getCondType();
    return res.fold(
        (l) => AppConfig.handleErrorMessage(l.error), (data) => data);
  }

  //Create New Properties

  // createNewProperties(BuildContext context, [String? proId]) async {
  //   state = true;
  //   AddProperty? property = _ref.read(addPropertyProvider);
  //   List<PlatformFile> filepath = _ref.read(selectedImageProvider);
  //   final res =
  //       await _propertiesRepository.addProperty(property!, filepath, proId);
  //   res.fold((l) {
  //     state = false;
  //     AppConfig.handleErrorMessage(l.error);
  //   }, (data) async {
  //     AppConfig.showToast(
  //         'Property ${proId == null ? "Added" : "Updated"} Successfully');
  //     await Future.delayed(Duration(seconds: 3))
  //         .then((value) => pushToAndClearStack(context, ControlScreen()));
  //     state = false;
  //     await _ref.refresh(allAgentProperties.future);
  //     _ref.invalidate(getAgentPropertiesbyIdProvider);
  //   });
  // }

  // checkListingCoin(BuildContext context) async {
  //   state = true;
  //   _ref.watch(coinNotifier.notifier).update((state) => true);
  //   final homeSection = _ref.read(homeControllerProvider);
  //   final res = await _propertiesRepository.checkListingCoin();
  //   res.fold((l) {
  //     // state = false;
  //     _ref.watch(coinNotifier.notifier).update((state) => false);

  //     if (l.error.response?.statusCode == 417) {
  //       generalDialogBox(
  //           context,
  //           NoCoinAlert(
  //             lastMsg: 'List Jobs/Properties',
  //           ));
  //     } else {
  //       AppConfig.handleErrorMessage(l.error);
  //     }
  //   }, (r) {
  //     _ref.watch(coinNotifier.notifier).update((state) => false);

  //     state = false;
  //     if (homeSection == Section.Properties) {
  //       pushTo(context, CreatePropertyListing());
  //     } else {
  //       pushTo(context, CreateNewJob());
  //     }
  //   });
  // }
}
