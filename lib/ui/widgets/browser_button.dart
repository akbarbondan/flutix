part of 'widgets.dart';

class BrowserButton extends StatelessWidget {
  final String genre;
  BrowserButton(this.genre);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Color(0xBEEBEFF6),
                borderRadius: BorderRadius.circular(8),
                image:
                    DecorationImage(image: AssetImage(pickImageGenres(genre))))),

                    Text(genre)
      ],
    );
  }

  pickImageGenres(String genre) {
    switch (genre) {
      case "Horror":
        return "assets/image/ic_horror.png";
        break;
      case "War":
        return "assets/image/ic_war.png";
        break;
      case "Drama":
        return "assets/image/ic_drama.png";
        break;
      case "Action":
        return "assets/image/ic_action.png";
        break;

      case "Chrime":
        return "assets/image/ic_chrime.png";
        break;

      case "Music":
        return "assets/image/ic_music.png";
        break;
      default:
    }
  }
}
