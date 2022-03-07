part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> gendres = [
    "Horror",
    "Drama",
    "Action",
    "Chrime",
    "Music",
    "War"
  ];

  final List<String> language = [
    "English",
    "Japanese",
    "Bahasa Indonesia",
    "Korean"
  ];

  final RegistrationData registrationData;
  PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGendres = [];
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        widget.registrationData.password = "";
        context.bloc<PageBloc>().add(GoToSignUpPage(widget.registrationData));

        return;
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 56,
                      margin: EdgeInsets.only(top: 20, bottom: 4),
                      child: GestureDetector(
                          onTap: () {
                            widget.registrationData.password = "";
                            context
                                .bloc<PageBloc>()
                                .add(GoToSignUpPage(widget.registrationData));
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black))),
                  Text("Select Your Four \n Favorite Genres",
                      style: blackTextFont.copyWith(fontSize: 20)),
                  SizedBox(height: 16),
                  Wrap(
                    runSpacing: 24,
                    spacing: 24,
                    children: generateGenresWidgets(context),
                  ),

                  SizedBox(height: 24),
                  Text("Movie your Language \nYou Prefer?", style:blackTextFont.copyWith(fontSize:20)),
                  SizedBox(height:16),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateLanguageWidgets(context),
                  ), 
                  SizedBox(height:30),
                  Center(child: FloatingActionButton(
                   elevation: 0,
                    backgroundColor: mainColor,
                    child: Icon(Icons.arrow_forward), onPressed: (){
                      if(selectedGendres.length != 4){
                        Flushbar(
                          backgroundColor: Color(0xFFFF5C83),
                          flushbarPosition: FlushbarPosition.TOP,
                          message: "Please selected 4 genres",
                          duration: Duration(milliseconds: 1500)
                        )..show(context);
                      }else{
                        widget.registrationData.selectedGeres = selectedGendres;
                        widget.registrationData.selectedLanguage = selectedLanguage;
                        context.bloc<PageBloc>().add(GoToConfirmationPage(widget.registrationData));
                      }
                    },
                  )),
                  SizedBox(height: 50)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

List<Widget> generateLanguageWidgets(BuildContext context){
  double width = (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) /2;
  return widget.language.map((e) => SelectabelBoxWidget(e, width: width, isSelected: selectedLanguage == e, onTap: (){
    setState((){
      selectedLanguage = e;
    });
  })).toList();
}

  List<Widget> generateGenresWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    return widget.gendres
        .map(
          (e) => SelectabelBoxWidget(e,
              width: width, isSelected: selectedGendres.contains(e), onTap: () {
            onSelectGendres(e);
          }),
        ).toList();

    
  }

  void onSelectGendres(String genres) {
    if (selectedGendres.contains(genres)) {
      setState(() {
         setState((){
          selectedGendres.remove(genres);
        });
        
      });
    } else {
      if (selectedGendres.length < 4) {
        setState((){
          selectedGendres.add(genres);
        });
      }
    }
  }
}
