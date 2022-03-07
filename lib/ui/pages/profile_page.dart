part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  Widget generateDhaseDivider(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 2 * defaultMargin,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth = 5.0;
          final dashHeight = 3.0;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xBABABABA)),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          body: Stack(children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                  if (userState is UserLoadState) {
                    ModelUser user = userState.user;

                    return Column(children: [
                      // Photo
                      Center(
                        child: Container(
                          height: 150,
                          width: 255,
                          margin: EdgeInsets.only(top: 70, bottom: 27),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.only(top: 35, left: 100),
                                        height: 50,
                                        width: 50,
                                        child: SpinKitFadingCircle(
                                            color: mainColor)),
                                    Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: (userState.user
                                                            .profilePicture !=
                                                        "")
                                                    ? NetworkImage(userState
                                                        .user.profilePicture)
                                                    : AssetImage(
                                                        "assets/image/picture_user.png")))),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        2 * defaultMargin,
                                    child: Text(userState.user.name,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.clip,
                                        style: blackTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400))),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        2 * defaultMargin,
                                    child: Text(userState.user.email,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style:
                                            greyTextFont.copyWith(fontSize: 16),
                                        overflow: TextOverflow.clip))
                              ]),
                        ),
                      )
                    ]);
                  } else {
                    return SizedBox();
                  }
                }),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) => GestureDetector(
                          onTap: () {
                            // context.bloc<PageBloc>().add(GoToEditProfile((userState as UserLoadedState).user));
                          },
                          child: Row(children: [
                            SizedBox(
                                width: 24,
                                height: 24,
                                child: Image(
                                    image: AssetImage(
                                        "assets/image/profile.png"))),
                            SizedBox(width: 10),
                            Text("Edit Profile",
                                style: blackTextFont.copyWith(fontSize: 16))
                          ]))),
                  generateDhaseDivider(context),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: (){
                      context.bloc<PageBloc>().add(GoToWalletPage(GoToProfilePage()));
                    }
                                     , child: Row(children: [
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Image(
                              image: AssetImage("assets/image/profile.png"))),
                      SizedBox(width: 10),
                      Text("My Wallet",
                          style: blackTextFont.copyWith(fontSize: 16))
                    ]),
                  ),
                  generateDhaseDivider(context),
                  SizedBox(height: 10),
                  Row(children: [
                    SizedBox(
                        width: 24,
                        height: 24,
                        child: Image(
                            image: AssetImage("assets/image/translite.jpg"))),
                    SizedBox(width: 10),
                    Text("Change Language",
                        style: blackTextFont.copyWith(fontSize: 16))
                  ]),
                  generateDhaseDivider(context),
                  SizedBox(height: 10),
                  Row(children: [
                    SizedBox(
                        width: 24,
                        height: 24,
                        child: Image(
                            image: AssetImage("assets/image/verified.png"))),
                    SizedBox(width: 10),
                    Text("Help Center",
                        style: blackTextFont.copyWith(fontSize: 16))
                  ]),
                  generateDhaseDivider(context),
                  SizedBox(height: 10),
                  Row(children: [
                    SizedBox(
                        width: 24,
                        height: 24,
                        child:
                            Image(image: AssetImage("assets/image/thumb.png"))),
                    SizedBox(width: 10),
                    Text("Rate Flutix App",
                        style: blackTextFont.copyWith(fontSize: 16))
                  ]),
                  generateDhaseDivider(context),
                  SizedBox(height: 10),
                ])
              ],
            ))
      ])),
    );
  }
}
