import '../../../../packages.dart';
// import '../../property/model/homefeed_properties.dart';

final searchControlProvider =
    StateNotifierProvider<SearchController, OptionModel?>((ref) {
  return SearchController(
      ref: ref, searchControlProvider: ref.watch(searchRepoProvider));
});

final listingOptionProvider = StateProvider<OptionModel?>((ref) {
  return null;
});


// final searchProvider = FutureProvider.family<List<Listing>,String>((ref, text) async {
//   return ref.read(searchControlProvider.notifier).searchProperties(text);
// });


class SearchController extends StateNotifier<OptionModel?> {
  Ref _ref;
  SearchRepository _searchRepository;
  SearchController(
      {required Ref ref, required SearchRepository searchControlProvider})
      : _ref = ref,
        _searchRepository = searchControlProvider,
        super(null);

  List<OptionModel> propertiesType = [
    OptionModel(isTap: false, name: 'House'),
    OptionModel(isTap: false, name: 'Apartment'),
    OptionModel(isTap: false, name: 'Condos'),
    OptionModel(isTap: false, name: 'TownHouse'),
    OptionModel(isTap: false, name: 'Duplex'),
    OptionModel(isTap: false, name: 'Detach House'),
    OptionModel(isTap: false, name: 'Residential'),
  ];

  List<OptionModel> listingType = [
    OptionModel(isTap: false, name: 'Rent'),
    OptionModel(isTap: false, name: 'Sale'),
    OptionModel(isTap: false, name: 'Both'),
  ];

  updatePropertiesModel(OptionModel model) {
    state = model.copyWith(isTap: true);
    // print(state!.name);
  }

  updateLsitingModel(OptionModel model) {
    _ref.watch(listingOptionProvider.notifier).update((state) => model);
  }

  // Future<List<Listing>> searchProperties(String text) async {
  //   final res = await _searchRepository.searchProperties(text);
  //   return res.fold((l) => AppConfig.handleErrorMessage(l.error), (searchRes) => searchRes);
  // }
}
