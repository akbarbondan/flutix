part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;
  void initState() {
    super.initState();
    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: Stack(
          children: [
            Container(color: accentColor1),
            SafeArea(child: Container(color: Color(0xFFF6F7F9))),

            /// Content
            PageView(
              onPageChanged: (index) {
                setState(() {
                  bottomNavbarIndex = index;
                });
              },
              controller: pageController,
              children: [MoviePage()
              , TicketPage()],
            ),
           
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.only(bottom: 42),
                child: FloatingActionButton(
                    backgroundColor: accentColor2,
                    elevation: 0,
                    child: SizedBox(
                        height: 26,
                        width: 26,
                        child: Icon(MdiIcons.walletPlus,
                            color: Colors.black.withOpacity(0.54))),
                    onPressed: () {
                      // context.bloc<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
                     AuthServices.signOut();
                    }),
              ),
            ),

             customButtonNavbarWidget(),
          ],
        ));
  }

  Widget customButtonNavbarWidget() => Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  bottomNavbarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
      
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: bottomNavbarIndex,
              items: [
                BottomNavigationBarItem(
                  title: Text("New Movies",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                  icon: Container(
                      height: 20,
                      margin: EdgeInsets.only(bottom: 6),
                      child: Image.asset((bottomNavbarIndex == 0)
                          ? "assets/image/ic_movie.png"
                          : "assets/image/ic_movie.nactive.png", fit:BoxFit.cover)),
                ),
                BottomNavigationBarItem(
                  title: Text("New Movies",
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                  icon: Container(
                    height: 20,
                    margin: EdgeInsets.only(bottom: 6),
                    child: Image.asset((bottomNavbarIndex == 1)
                        ? "assets/image/ic_btn.tiket.png"
                        : "assets/image/ic_btn.tiket.nactive.png"),
                  ),
                ),
              ],
            )),
      ));
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
