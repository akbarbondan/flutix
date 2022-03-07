part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;
  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .bloc<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(children: [
              Column(children: [
                Container(
                    margin: EdgeInsets.only(bottom: 90, top: 20),
                    height: 56,
                    child: Stack(children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToPreferencePage(
                                    widget.registrationData));
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black))),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Text("Confirm \nNew Account",
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(fontSize: 20)))
                    ])),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage( fit: BoxFit.cover,
                          image: (widget.registrationData.profilePictureImage ==
                                  null)
                              ? AssetImage("assets/image/picture_user.png")
                              : FileImage(widget
                                  .registrationData.profilePictureImage))),
                ),
                Text("Welcome",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300)),
                Text("${widget.registrationData.name}",
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(fontSize: 20)),
                SizedBox(height: 110),
                (isSigningUp)
                    ? SpinKitFadingCircle(color: Color(0xFF3E9D9D), size: 45)
                    : SizedBox(
                        width: 250,
                        height: 45,
                        child: RaisedButton(
                            color: Color(0xFF3E9D9D),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text("Create My Account",
                                style: whiteTextFont.copyWith(fontSize: 16)),
                            onPressed: () async {
                              setState(() {
                                isSigningUp = true;
                              });
                              imageProfile =
                                  widget.registrationData.profilePictureImage;

                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registrationData.email,
                                      widget.registrationData.password,
                                      widget.registrationData.name,
                                      widget.registrationData.selectedGeres,
                                      widget.registrationData.selectedLanguage);

                              if (result.user == null) {
                                setState(() {
                                  isSigningUp = false;
                                });
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  message: result.message,
                                  backgroundColor: Color(0xFFFF5C83),
                                )..show(context);
                              }
                            }))
              ])
            ])),
      ),
    );
  }
}
