import '../../../packages.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.onSwitch,
    this.text,
    this.switchState,
  });
  final Function(bool) onSwitch;
  final Widget? text;
  final dynamic switchState;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _on = false;
  dynamic sub;
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _on = !_on;
        });
        widget.onSwitch(_on);
      },
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: _on ? Alignment.centerRight : Alignment.centerLeft,
            height: 25,
            width: 45,
            decoration: BoxDecoration(
              color: _on ? AppColors.primary : const Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(100),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: _on ? AppColors.primary : const Color(0xFFEBEBEB),
                  width: 3,
                ),
              ),
              width: 25,
              height: 25,
            ),
          ),
          if (widget.text != null) const SizedBox(width: 10),
          if (widget.text != null) widget.text as Widget,
        ],
      ),
    );
  }
}
