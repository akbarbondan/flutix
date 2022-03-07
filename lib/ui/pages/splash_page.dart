part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 136,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/logo.png")))),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "New Experience",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              "Watch a new movie much \neasier than any before",
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 70, bottom: 19),
              child: RaisedButton(
                  color: mainColor,
                  child: Text(
                    "Get Started",
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    context.bloc<PageBloc>().add(GoToSignUpPage(RegistrationData()));
                  }),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text(
                    "Sign In",
                    style: purpleTextFont.copyWith(fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
