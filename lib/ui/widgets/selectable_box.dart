part of 'widgets.dart';

class SelectabelBoxWidget extends StatelessWidget {
  final bool isSelected;
  final bool isEnable;
  final String text;
  final double height;
  final double width;
  final Function onTap;
  final TextStyle textStyle;
  SelectabelBoxWidget(this.text,
      {this.isEnable = true,
      this.isSelected = false,
      this.height = 60,
      this.width = 144,
      this.textStyle,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
                color: (!isEnable)
                    ? Color(0xFFE4E4E4)
                    : (isSelected)
                        ? Colors.transparent
                        : Color(0xFFE4E4E4)),
            borderRadius: BorderRadius.circular(6),
            color: (!isEnable)
                ? Color(0xFFE4E4E4)
                : (!isSelected)
                    ? Colors.transparent
                    : accentColor2),
        child: Center(
          child: Text(text ?? "None",
              style: (textStyle ?? blackTextFont)
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
