part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;
  SignUpPage(this.registrationData);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();

  initState() {
    super.initState();
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeThemeEvent(ThemeData().copyWith(primaryColor: Colors.grey)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            color: Colors.white,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20, bottom: 22),
                        height: 56,
                        child: Stack(children: [
                          GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToSplashPage());
                              },
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.black))),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text("Create New \nAccount",
                                  textAlign: TextAlign.center,
                                  style: blackTextFont.copyWith(
                                    fontSize: 18,
                                  )))
                        ])),
                    Container(
                        height: 104,
                        width: 90,
                        child: Stack(children: [
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: ((widget.registrationData
                                                  .profilePictureImage ==
                                              null)
                                          ? AssetImage(
                                              "assets/image/picture_user.png")
                                          : FileImage(widget.registrationData
                                              .profilePictureImage)),
                                      fit: BoxFit.cover))),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () async {
                                  if (widget.registrationData
                                          .profilePictureImage ==
                                      null) {
                                    widget.registrationData
                                        .profilePictureImage = await getImage();
                                  } else {
                                    widget.registrationData
                                        .profilePictureImage = null;
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage((widget
                                                        .registrationData
                                                        .profilePictureImage ==
                                                    null)
                                                ? "assets/image/ic_add.png"
                                                : "assets/image/ic_remove_img.png")))),
                              ))
                        ])),
                    SizedBox(height: 36),
                    TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Full Name",
                            hintText: "Full Name")),
                    SizedBox(height: 16),
                    TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Email",
                            hintText: "example@gmail.com")),
                    SizedBox(height: 16),
                    TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Password",
                            hintText: "Password")),
                    SizedBox(height: 16),
                    TextField(
                        controller: confrimPasswordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Confrimation Password",
                            hintText: "Confrimation Password")),
                    SizedBox(
                      height: 30,
                    ),
                    FloatingActionButton(
                        onPressed: () {
                          if (!(nameController.text.trim() != "" &&
                              emailController.text.trim() != "" &&
                              passwordController.text.trim() != "" &&
                              confrimPasswordController != "")) {
                            Flushbar(
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Please fill all the fields")
                              ..show(context);
                          } else if (passwordController.text !=
                              confrimPasswordController.text) {
                            Flushbar(
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message:
                                    "Mismatch password adn confirmed password")
                              ..show(context);
                          } else if (passwordController.text.length < 6) {
                            Flushbar(
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Password's length min 6")
                              ..show(context);
                          } else if (!EmailValidator.validate(
                              emailController.text)) {
                            Flushbar(
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Wrong formated email address")
                              ..show(context);
                          } else {
                            widget.registrationData.name = nameController.text;
                            widget.registrationData.email =
                                emailController.text;
                            widget.registrationData.password =
                                passwordController.text;
                            context.bloc<PageBloc>().add(GoToPreferencePage(
                                
                                    widget.registrationData));
                          }
                        },
                        child: Icon(Icons.arrow_forward),
                        backgroundColor: mainColor,
                        elevation: 0),
                    SizedBox(height: 40)
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
