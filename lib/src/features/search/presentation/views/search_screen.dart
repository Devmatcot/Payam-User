// import '../../../../../packages.dart';
// import '../../../home/presentation/widgets/search_textfield.dart';
// // import '../../../listing/presentation/widgets/large_grid.dart';
// import '/src/features/search/controller/search_controller.dart';

// class SearchScreen extends ConsumerStatefulWidget {
//   final String? searchText;

//   const SearchScreen({this.searchText, super.key});

//   @override
//   ConsumerState<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends ConsumerState<SearchScreen> {
//   TextEditingController? controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController(text: widget.searchText);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller?.dispose();
//   }

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     // final latest = ref.watch(homeFeedProvider).latestListings;
//     return OverlayWidget(
//       title: 'Search',
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10).r,
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: SearchTextField(
//                     controller: controller,
//                     hintText: widget.searchText ?? 'Search for Properties',
//                   ),
//                 ),
//                 // 20.0.spacingW,
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     pushTo(context, FilterScreen());
//                 //   },
//                 //   child: Container(
//                 //     padding: EdgeInsets.all(10).r,
//                 //     child: SvgWidget(AssetConstants.filter),
//                 //     decoration: BoxDecoration(
//                 //         borderRadius: BorderRadius.circular(15).r,
//                 //         color: AppColors.primary),
//                 //   ),
//                 // )
//               ],
//             ),
//             10.0.spacingH,
//             Expanded(
//               child: ref.watch(searchProvider(widget.searchText ?? '')).when(
//                     data: (result) {
//                       return Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               '${result.length} Properties Found',
//                               style: AppTextStyle.bodyText1
//                                   .copyWith(fontWeight: AppFontWeight.semiBold),
//                             ),
//                           ),
//                           10.0.spacingH,
//                           Expanded(
//                             child: result.isEmpty
//                                 ? Center(
//                                     child: Text(
//                                       'No Result Found',
//                                       style: AppTextStyle.headline1,
//                                     ),
//                                   )
//                                 : ListView.builder(
//                                     itemCount: result.length,
//                                     itemBuilder: (context, index) =>
//                                         LargeGridChild(
//                                       list: result[index],
//                                     ),
//                                   ),
//                           )
//                         ],
//                       );
//                     },
//                     error: (e, s) => Text(e.toString()),
//                     loading: () => Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
