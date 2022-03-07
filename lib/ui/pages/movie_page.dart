part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                SizedBox(
                  height: 115,
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text("Now Playing",
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                SizedBox(
                    height: 140,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (_, movieState) {
                        if (movieState is MovieLoadedState) {
                          List<ModelMovie> movie =
                              movieState.movies.sublist(0, 10);
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.length,
                            itemBuilder: (_, index) {
                              return Container(
                                  margin: EdgeInsets.only(
                                      left: (index == 0) ? defaultMargin : 0,
                                      right: (index == movie.length - 1)
                                          ? defaultMargin
                                          : 16),
                                  child: MovieCard(
                                    movie[index],
                                    onTap: () {
                                      context.bloc<PageBloc>().add(
                                          GoToMovieDetailPage(movie[index]));
                                    },
                                  ));
                            },
                          );
                        } else {
                          return SpinKitFadingCircle(
                              size: 50, color: mainColor);
                        }
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text("Browse Movie",
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                  if (userState is UserLoadState) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                userState.user.selectedGendres.length,
                                (index) => BrowserButton(
                                    userState.user.selectedGendres[index]))));
                  } else {
                    return SpinKitFadingCircle(size: 50, color: mainColor);
                  }
                }),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text("Comming Soon",
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                SizedBox(
                    height: 140,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (_, movieState) {
                        if (movieState is MovieLoadedState) {
                          List<ModelMovie> movie =
                              movieState.movies.sublist(10);
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.length,
                            itemBuilder: (_, index) {
                              return Container(
                                  margin: EdgeInsets.only(
                                      left: (index == 0) ? defaultMargin : 0,
                                      right: (index == movie.length - 1)
                                          ? defaultMargin
                                          : 16),
                                  child: CommingsoonCard(movie[index]));
                            },
                          );
                        } else {
                          return SpinKitFadingCircle(
                              size: 50, color: mainColor);
                        }
                      },
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text("Get Lucky Day",
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                Column(
                    children: dummyPromos
                        .map((e) => Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 16),
                              child: PromoCard(e),
                            ))
                        .toList()),
                SizedBox(height: 100)
              ],
            ),
          ),
          header(context)
        ],
      ),
    );
  }

  Widget header(BuildContext context) => Container(
        height: 120,
        decoration: BoxDecoration(
            color: accentColor1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
        child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
          if (userState is UserLoadState) {
            if (imageProfile != null) {
              uploadImage(imageProfile).then((downloadUrl) {
                imageProfile = null;
                context
                    .bloc<UserBloc>()
                    .add(UpdateDataUser(imageProfile: downloadUrl));
              });
            } else {}
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF5F558B), width: 1)),
                  child: Stack(
                    children: [
                      SpinKitFadingCircle(color: accentColor2, size: 50),
                      GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToProfilePage());
                        },
                        child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: (userState.user.profilePicture == "")
                                        ? AssetImage(
                                            "assets/image/picture_user.png")
                                        : NetworkImage(
                                            userState.user.profilePicture)))),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            78,
                        child: Text(userState.user.name,
                            style: whiteTextFont.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip)),
                    GestureDetector(
                                          onTap:(){
                                            context.bloc<PageBloc>().add(GoToWalletPage(GoToMainPage()));
                                          },
                                          child: Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR ")
                              .format(userState.user.balance),
                          style: yellowNumberFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    )
                  ],
                )
              ],
            );
          } else {
            return Center(
                child: Container(
                    height: 50,
                    width: 50,
                    child: SpinKitFadingCircle(
                      color: accentColor2,
                      size: 50,
                    )));
          }
        }),
      );
}
