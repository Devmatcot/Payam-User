import '/packages.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, Section>((ref) {
  return HomeController(ref: ref);
});
final currentPageProvider = StateProvider<int>((ref) {
  return 0;
});

enum Section {
  Properties,
  Jobs,
}

class HomeController extends StateNotifier<Section> {
  Ref _ref;
  HomeController({required Ref ref})
      : _ref = ref,
        super(Section.Properties) {}
  PageController controller = PageController();
  updateSection(Section sec) {
    state = sec;
  }

  updatePage(int index) {
    controller.jumpToPage(index);
    _ref.read(currentPageProvider.notifier).update((state) => index);
  }
}
