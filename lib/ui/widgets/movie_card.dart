part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  final ModelMovie movie;
  final Function onTap;
  MovieCard(this.movie, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap();
        }
      },
          child: Container(
        height: 140,
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl + "w780" + movie.backdropPath))),
        child: Container(
            height: 140,
            width: 210,
            padding: EdgeInsets.fromLTRB(15, 0, 24, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.61),
                      Colors.black.withOpacity(0)
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                    style: whiteTextFont,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                RattingStars(voteAverage: movie.voteAverage, color: accentColor2),
              ],
            )),
      ),
    );
  }
}
