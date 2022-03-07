part of 'pages.dart';

class CheckOutPage extends StatefulWidget {
  final TicketModel ticket;
  CheckOutPage(this.ticket);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSelectSeatsPage(widget.ticket));
        return;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(color: mainColor),
          SafeArea(
            child: Container(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        height: 56,
                        child: Stack(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  context
                                      .bloc<PageBloc>()
                                      .add(GoToSelectSeatsPage(widget.ticket));
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.black)),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Text("Checkout \nMovie",
                                    style: blackTextFont.copyWith(fontSize: 20),
                                    textAlign: TextAlign.center))
                          ],
                        )),
                    BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                      ModelUser user = (userState as UserLoadState).user;

                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 90,
                                  width: 70,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(imgUrl +
                                              "w342" +
                                              widget.ticket.movieDetail
                                                  .posterPath)))),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                90,
                                        child: Text(
                                            widget.ticket.movieDetail.title,
                                            style: blackTextFont.copyWith(
                                                fontSize: 18),
                                            maxLines: 2,
                                            overflow: TextOverflow.clip)),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          90,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                          widget.ticket.movieDetail
                                              .genreAndLanguage,
                                          style: greyTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    RattingStars(
                                        voteAverage: widget
                                            .ticket.movieDetail.voteAverage,
                                        color: accentColor3)
                                  ])
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(
                                  color: Color(0xFFE4E4E4), thickness: 1)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order ID",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(widget.ticket.bookingCode,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ]),
                          SizedBox(height: 9),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cinema",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(widget.ticket.theather.name,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.end),
                                )
                              ]),
                          SizedBox(height: 9),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date & Time",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(widget.ticket.time.dateAndTime,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ]),
                          SizedBox(height: 9),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Seat Numbers",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(widget.ticket.seatsInString,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                )
                              ]),
                          SizedBox(height: 9),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order ID",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(widget.ticket.bookingCode,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ]),
                          SizedBox(height: 9),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Price",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    "IDR 25.000 X ${widget.ticket.seats.length}",
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ]),
                          SizedBox(height: 9),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Fee",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    "IDR 1.500 X ${widget.ticket.seats.length}",
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ]),
                          SizedBox(height: 9),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID',
                                            decimalDigits: 0,
                                            symbol: 'IDR ')
                                        .format(total),
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))
                              ]),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(
                                  color: Color(0xFFE4E4E4), thickness: 1)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Your Wallet",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID',
                                            decimalDigits: 0,
                                            symbol: 'IDR ')
                                        .format(user.balance),
                                    style: whiteNumberFont.copyWith(
                                        color: user.balance >= total
                                            ? Color(0xFF3E9D9D)
                                            : Color(0xFFFF5C83),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))
                              ]),
                          Container(
                              width: 250,
                              height: 46,
                              margin: EdgeInsets.only(top: 36, bottom: 50),
                              child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                color: user.balance >= total
                                    ? Color(0xFF3E9D9D)
                                    : mainColor,
                                    onPressed: (){
                                        if(user.balance >= total){
                                          FluttixTransactionModel transaction = FluttixTransactionModel(
                                            userID: user.id,
                                            title: widget.ticket.movieDetail.title,
                                            subTitle: widget.ticket.theather.name,
                                            time: DateTime.now(),
                                            amount: -total,
                                            picture: widget.ticket.movieDetail.posterPath
                                          );

                                          context.bloc<PageBloc>().add(GoToSuccesTransactionPage(widget.ticket.copyWith(totalPrice: total ), transaction));
                                        }else{
                                          // uang tidak cukup
                                        }
                                    },
                                child: Text(
                                    user.balance >= total
                                        ? "Checkout Now"
                                        : "Top Up My Wallet",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 19)),
                              ))
                        ],
                      );
                    }),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
