part of 'pages.dart';

class TicketDetailPage extends StatefulWidget {
  final TicketModel ticket;

  TicketDetailPage(this.ticket);

  @override
  _TicketDetailPageState createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  @override
  Widget build(BuildContext context) {

    Widget generateDhaseDivider(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 0.3,
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
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage(
            bottomNavBarIndex: 1,
            isExpired: widget.ticket.time.isBefore(DateTime.now())));
        return;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          color: Color(0xFFE5E5E5),
          child: ListView(children: [
            Column(children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(children: [
                  GestureDetector(
                    onTap: () {
                      context.bloc<PageBloc>().add(GoToMainPage(
                          bottomNavBarIndex: 1,
                          isExpired:
                              widget.ticket.time.isBefore(DateTime.now())));
                    },
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            child:
                                Icon(Icons.arrow_back, color: Colors.black))),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          child: Text("Ticket Detail",
                              style: blackTextFont.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w400))))
                ]),
              ),
              Container(
                  height: 170,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(imgUrl +
                              "w780" +
                              widget.ticket.movieDetail.posterPath)))),

              /// Content
              ClipPath(
                clipper: TicketTopClipper(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.ticket.movieDetail.title,
                            style: blackTextFont.copyWith(fontSize: 18),
                            overflow: TextOverflow.clip),
                        Text(widget.ticket.movieDetail.genreAndLanguage,
                            style: greyTextFont.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                        SizedBox(height: 6),
                        RattingStars(
                            voteAverage: widget.ticket.movieDetail.voteAverage,
                            alignment: MainAxisAlignment.start,
                            color: accentColor2),
                        SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cinema",
                                  style: greyTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Text("${widget.ticket.theather.name}", maxLines: 2,
                                  style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))
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
                                width: MediaQuery.of(context).size.width * 0.55,
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
                        SizedBox(height: 20),
                        generateDhaseDivider(context),
                      ]),
                ),
                
              ),
  
              /// TUTUP

              ClipPath(
                clipper: TicketBottomCliper(),
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name: ",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(widget.ticket.name,
                                    style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 8),
                                Text("Paid: ",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    NumberFormat.currency(
                                            locale: "id_ID",
                                            decimalDigits: 0,
                                            symbol: "IDR ")
                                        .format(widget.ticket.totalPrice),
                                    style: whiteNumberFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black))
                              ]),

                              QrImage(
                                version: QrVersions.auto,
                                foregroundColor: Colors.black,
                                errorCorrectionLevel: QrErrorCorrectLevel.L,
                                padding: EdgeInsets.all(0),
                                size: 100,
                                data: widget.ticket.bookingCode

                              )
                        ])),
              )
            ]),
          ]),
        ),
      ),
    );
  }
}

class TicketTopClipper extends CustomClipper<Path> {
  double radius = 15;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TicketBottomCliper extends CustomClipper<Path> {
  double radius = 15;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
