part of 'pages.dart';

class SelectShedulePage extends StatefulWidget {
  final ModelMovieDetail movieDetail;
  SelectShedulePage(this.movieDetail);

  @override
  _SelectShedulePageState createState() {
    print(movieDetail.title);
    return _SelectShedulePageState();
  }
}

class _SelectShedulePageState extends State<SelectShedulePage> {
  List<DateTime> dates;
  DateTime selectDate;
  int selectTime;
  TheaterModel selectedTeather;

  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMovieDetailPage(widget.movieDetail));
        return;
      },
      child: Scaffold(
          body: Stack(children: [
        Container(color: mainColor),
        SafeArea(child: Container(color: Colors.white)),
        ListView(
          children: [
            Row(children: [
              Container(
                  margin: EdgeInsets.only(top: 20, left: defaultMargin),
                  padding: EdgeInsets.all(1),
                  child: GestureDetector(
                      onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToMovieDetailPage(widget.movieDetail));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.black)))
            ]),
            Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 16),
                child: Text("Choose Date",
                    style: blackTextFont.copyWith(fontSize: 20))),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 90,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.only(
                              left: (index == 0) ? defaultMargin : 6,
                              right: (index < dates.length - 1)
                                  ? 16
                                  : defaultMargin),
                          child: DateCard(dates[index],
                              isSelected: selectDate == dates[index],
                              onTap: () {
                            setState(() {
                              selectDate = dates[index];
                            });
                          }),
                        ))),
            generateTimeTable(),
            // button Bottom
            SizedBox(height: 10),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                return Align(
                    alignment: Alignment.topCenter,
                    child: FloatingActionButton(
                        onPressed: () {
                          if (isValid) {
                            context.bloc<PageBloc>().add(GoToSelectSeatsPage(
                                TicketModel(
                                    widget.movieDetail,
                                    selectedTeather,
                                    DateTime(selectDate.year, selectDate.month,
                                        selectDate.day, selectTime),
                                    randomAlphaNumeric(12).toUpperCase(),
                                    null,
                                    (userState as UserLoadState).user.name,
                                    null)));
                          }
                        },
                        elevation: 0,
                        backgroundColor:
                            (isValid) ? mainColor : Color(0xFFE4E4E4),
                        child: Icon(Icons.arrow_forward,
                            color:
                                (isValid) ? Colors.white : Color(0xFFBEBEBE))));
              },
            ),
          SizedBox(height:40)
          ],
        )
      ])),
    );
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theather in dummyTheaters) {
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
          child: Text(theather.name,
              style: blackTextFont.copyWith(fontSize: 20))));

      widgets.add(Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 50,
          child: ListView.builder(
              itemCount: schedule.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right:
                            (index < schedule.length - 1) ? 16 : defaultMargin),
                    child: SelectabelBoxWidget("${schedule[index]}:00",
                        height: 50,
                        isSelected: selectedTeather == theather &&
                            selectTime == schedule[index],
                        isEnable: schedule[index] > DateTime.now().hour ||
                            selectDate.day != DateTime.now().day, onTap: () {
                      setState(() {
                        selectedTeather = theather;
                        selectTime = schedule[index];
                        isValid = true;
                      });
                    }),
                  ))));
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }
}
