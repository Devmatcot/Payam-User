import '../../../packages.dart';

generalDialogBox(BuildContext context, Widget widget) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
          scale: curve,
          child: Dialog(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50).r,
              height: 350.h,
              child: widget,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10).r),
            ),
          ));
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
