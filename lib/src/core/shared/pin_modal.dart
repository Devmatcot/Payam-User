

import '../../../packages.dart';

class PinModal extends ConsumerStatefulWidget {
  final VoidCallback onDone;
  const PinModal({required this.onDone, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PinModalState();
}

class _PinModalState extends ConsumerState<PinModal> {
  TextEditingController _ctrl = TextEditingController();

  _eachNum(String num) {
    return InkWell(
      onTap: () async {
        // if (_ctrl.text.length >= 3) {
        //   pop(context);
        // }
        HapticFeedback.vibrate();
        setState(() {
          _ctrl.text = '${_ctrl.text}$num';
        });
        print(_ctrl.text);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: AppColors.gray),
        ),
        alignment: Alignment.center,
        height: double.infinity,
        child: Text(
          num,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: double.infinity,
      padding: EdgeInsets.all(25).r,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20).r,
            topLeft: Radius.circular(20).r,
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150.0).r,
            child: BottomSheetDivider(),
          ),
          20.0.spacingH,
          Text(
            'Enter Transaction PIN',
            style: AppTextStyle.headline2
                .copyWith(fontWeight: AppFontWeight.semiBold),
          ),
          20.0.spacingH,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
            child: PinCodeField(
              length: 4,
              height: height30 + height20,
              radius: 5,
              readOnly: true,
              obscure: true,
              controller: _ctrl,
              onChanged: (value) async {
                if (value.length == 4) {
                  // ref.read(pinProvider.notifier).update((state) => value);
                  Navigator.pop(context);
                  FocusManager.instance.primaryFocus?.unfocus();
                  widget.onDone();
                }
              },
            ),
          ),
          10.0.spacingH,
          Expanded(
              child: GridView(
            padding: EdgeInsets.symmetric(horizontal: 20).r,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 15 / 8,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            children: [
              _eachNum('1'),
              _eachNum('2'),
              _eachNum('3'),
              _eachNum('4'),
              _eachNum('5'),
              _eachNum('6'),
              _eachNum('7'),
              _eachNum('8'),
              _eachNum('9'),
              Container(),
              _eachNum('0'),
              InkWell(
                onTap: () {
                  HapticFeedback.vibrate();
                  if (_ctrl.text.isEmpty) return;
                  setState(() {
                    _ctrl.text = _ctrl.text.substring(0, _ctrl.text.length - 1);
                  });
                },
                child: Icon(Icons.backspace),
              )
            ],
          )),
        ],
      ),
    );
  }
}
