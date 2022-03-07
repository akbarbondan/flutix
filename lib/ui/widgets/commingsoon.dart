part of'widgets.dart';
class CommingsoonCard extends StatelessWidget {
  final ModelMovie movie;

  CommingsoonCard(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imgUrl + "w780" + movie.backdropPath))),
    );
  }
}
