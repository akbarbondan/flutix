part of 'widgets.dart';

class RattingStars extends StatelessWidget {
  final double voteAverage;
  final double starsSize;
  final double fontSize;
  final Color color;
  final MainAxisAlignment alignment;
  RattingStars({this.voteAverage = 0, this.starsSize = 20, this.fontSize = 12, this.color, this.alignment = MainAxisAlignment.start });
  @override
  Widget build(BuildContext context) {
    int n = (voteAverage /2).round();
    List<Widget> widgets = List.generate(
        5,
        (index) => Icon((index < n) ? MdiIcons.star : MdiIcons.starOutline,
            color: color, size: starsSize));
    widgets.add(SizedBox(width: 3));
    widgets.add(Text("$voteAverage/10",
        style: whiteNumberFont.copyWith(
            fontSize: fontSize, fontWeight: FontWeight.w300)));
    return Row(
      mainAxisAlignment: alignment,
      children: widgets);
  }
}
