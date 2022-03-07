part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final ModelMovie movie;

  MovieDetailPage(this.movie);
  @override
  Widget build(BuildContext context) {
    ModelMovieDetail movieDetail;
    List<ModelCredit> movieCredit;
    return WillPopScope(
        onWillPop: () {
          context.bloc<PageBloc>().add(GoToMainPage());
          return;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              Container(color: mainColor),
              SafeArea(
                  child: Container(
                      color: Colors.white,
                      child: ListView(
                        children: [
                          FutureBuilder(
                            future: MoiveServices.getDetailMovie(movie),
                            builder: (_, snapShot) {
                              if (snapShot.hasData) {
                                movieDetail = snapShot.data;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                            height: 270,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: (movie.backdropPath !=
                                                          null)
                                                      ? NetworkImage(imgUrl +
                                                          "w1280" +
                                                          movie.backdropPath)
                                                      : ""),
                                            ),
                                            child: Container(
                                                height: 270,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                      Colors.white,
                                                      Colors.transparent
                                                    ],
                                                        begin: Alignment(0, 1),
                                                        end: Alignment(
                                                            0, 0.06))))),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 20, left: defaultMargin),
                                            padding: EdgeInsets.all(1),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.black
                                                    .withOpacity(0.04)),
                                            child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .bloc<PageBloc>()
                                                      .add(GoToMainPage());
                                                },
                                                child: Icon(Icons.arrow_back,
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                            defaultMargin,
                                            16,
                                            defaultMargin,
                                            6),
                                        child: Text(movie.title,
                                            textAlign: TextAlign.center,
                                            style: blackTextFont.copyWith(
                                                fontSize: 24))),
                                    (snapShot.hasData)
                                        ? Text(
                                            movieDetail.genreAndLanguage,
                                            style: greyTextFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          )
                                        : SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: SpinKitFadingCircle(
                                                color: accentColor3)),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    RattingStars(
                                      voteAverage: movie.voteAverage,
                                      color: accentColor3,
                                      alignment: MainAxisAlignment.center,
                                    ),
                                    SizedBox(height: 24),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: defaultMargin,
                                                bottom: 12),
                                            child: Text("Cats & Crew",
                                                style: blackTextFont.copyWith(
                                                    fontSize: 14)))),
                                    FutureBuilder(
                                        future:
                                            MoiveServices.getCredits(movie.id),
                                        builder: (_, snapShot) {
                                          if (snapShot.hasData) {
                                            movieCredit = snapShot.data;
                                            return SizedBox(
                                              height: 115,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: movieCredit.length,
                                                  itemBuilder: (_, index) => Container(
                                                      margin: EdgeInsets.only(
                                                          left: (index == 0)
                                                              ? defaultMargin
                                                              : 0,
                                                          right: (index ==
                                                                  movieCredit
                                                                          .length -
                                                                      1)
                                                              ? defaultMargin
                                                              : 16),
                                                      child: CreditCard(
                                                          movieCredit[index]))),
                                            );
                                          } else {
                                            return SizedBox(
                                                height: 50,
                                                child: SpinKitFadingCircle(
                                                    color: mainColor));
                                          }
                                        }),
                                    Align(
                                      alignment: Alignment.topLeft,
                                                                          child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              defaultMargin,
                                              24,
                                              defaultMargin,
                                              8),
                                          child: Text("Storyline",
                                              style: blackTextFont)),
                                    ),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                            defaultMargin, 0, defaultMargin, 8),
                                        child: Text(movie.overview,
                                            style: greyTextFont.copyWith(
                                                fontWeight: FontWeight.w400))),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      color: mainColor,
                                      child: Text("Continue To Book",
                                          style: whiteTextFont.copyWith(
                                              fontSize: 16)),
                                      onPressed: () {
                                        context.bloc<PageBloc>().add(GoToSelectShecdulePage(movieDetail));
                                      }, 
                                    ),
                                    SizedBox(height: 50)
                                  ],
                                );
                              } else {
                                return SpinKitFadingCircle(
                                    size: 50, color: mainColor);
                              }
                            },
                          )
                        ],
                      )))
            ])));
  }
}
