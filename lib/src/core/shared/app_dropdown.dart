import '../../../packages.dart';

class AppCustomDropDown extends StatelessWidget {
  const AppCustomDropDown(
      {super.key,
      required this.itemList,
      required this.iconList,
      this.height = 600,
      required this.title});

  final List<dynamic> itemList;
  final List<dynamic> iconList;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height.h,
        margin: EdgeInsets.symmetric(horizontal: 24).r,
        padding: EdgeInsets.all(20).r,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20).r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.bodyText1,
                ),
                IconButton(
                    onPressed: () {
                      pop(context);
                    },
                    icon: Icon(Icons.close, color: AppColors.black54))
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10).r,
                  child: Container(
                    // padding: Ed,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25.r,
                          backgroundColor: AppColors.gray,
                        ),
                        10.0.spacingW,
                        Text(
                          itemList[index],
                          style: AppTextStyle.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
