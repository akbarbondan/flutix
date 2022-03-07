part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final TicketModel ticket;
  SelectSeatPage(this.ticket);

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
   List<String> selectSeats = [];
  @override
  Widget build(BuildContext context) {
   
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToSelectShecdulePage(widget.ticket.movieDetail));
        return;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(color: mainColor),
          SafeArea(
            child: Container(color: Colors.white),
          ),
          ListView(children: [
            Column(
              children: [
                // Header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: defaultMargin, top: 20),
                        child: GestureDetector(
                            child: Icon(Icons.arrow_back, color: Colors.black),
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToSelectShecdulePage(
                                      widget.ticket.movieDetail));
                            })),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: defaultMargin),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right:16),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(widget.ticket.movieDetail.title,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                style: blackTextFont.copyWith(
                                    fontSize: 20)),
                          ),
                          Container(
                             
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                      image: NetworkImage(imgUrl +
                                          "w154" +
                                          widget.ticket.movieDetail
                                              .backdropPath))))
                        ],
                      ),
                    )
                  ],
                ),

                Container(
                    width: 277,
                    height: 84,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/image/screen.png")))),

                generateSeats(),
                SizedBox(height:30),
                Align(
                  alignment: Alignment.topCenter,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: selectSeats.length > 0 ? mainColor : Color(0xFFBEBEBE),
                    child: Icon(Icons.arrow_forward, color: selectSeats.length > 0 ? Colors.white : Color(0xFFB4B4B4)),
                    onPressed: (){
                      if(selectSeats.length > 0){
                         context.bloc<PageBloc>().add(GoToCheckOutPage(widget.ticket.copyWith(seats: selectSeats )));
                      }else{
                        Flushbar(
                                duration: Duration(milliseconds: 1500),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Please select seats")
                              ..show(context);
                      }
                    }
                  )
                ),
                SizedBox(height:50)
              ],
            )
          ])
        ],
      )),
    );
  }

  Column generateSeats() {
    List<int> numberSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberSeats.length; i++) {
      widgets.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              numberSeats[i],
              (index) => Padding(
                    padding: EdgeInsets.only(
                        right: index < numberSeats[i] - 1 ? 16 : 0, bottom: 16),
                    child: SelectabelBoxWidget(
                        "${String.fromCharCode(i + 65)}${index + 1}",
                        width: 40,
                        height: 40,
                        textStyle:
                            whiteNumberFont.copyWith(color: Colors.black),
                            isEnable: index !=0,
                            isSelected: selectSeats.contains("${String.fromCharCode(i + 65)}${index + 1}"),
                            onTap:(){
                              String seatNumber = "${String.fromCharCode(i + 65)}${index + 1}";
                              setState(() {
                                if(selectSeats.contains(seatNumber)){
                                  selectSeats.remove(seatNumber);
                                }else{
                                  selectSeats.add(seatNumber);
                                }
                              });
                            }
                            ),
                  ))));
    }
    return Column(children: widgets);
  }
}
