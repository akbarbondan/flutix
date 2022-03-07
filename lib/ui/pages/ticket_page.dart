part of 'pages.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpiredTicket = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(children: [
        BlocBuilder<TicketBloc, TicketState>(
    builder: (_, ticketState) => Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: TicketView(isExpiredTicket
          ? ticketState.tickets
              .where((ticket) => ticket.time.isBefore(DateTime.now()))
              .toList()
          : ticketState.tickets
              .where((ticket) => !ticket.time.isBefore(DateTime.now()))
              .toList()),
    ),
        ),
        Container(color: mainColor, height: 113),
        SafeArea(
    child: ClipPath(
      clipper: HeaderClipper(),
      child: Container(
          height: 113,
          decoration: BoxDecoration(
            color: accentColor1,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 24, bottom: 32),
                    child: Text("My Tickets",
                        style: whiteTextFont.copyWith(fontSize: 20))),
                Row(children: [
                  Column(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpiredTicket = !isExpiredTicket;
                        });
                      },
                      child: Text("Newest",
                          style: whiteTextFont.copyWith(
                              fontSize: 16,
                              color: !isExpiredTicket
                                  ? accentColor2
                                  : Color(0xFF6F678E))),
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.5,
                        color: !isExpiredTicket
                            ? accentColor2
                            : Colors.transparent)
                  ]),
                  Column(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpiredTicket = !isExpiredTicket;
                        });
                      },
                      child: Text("Oldest",
                          style: whiteTextFont.copyWith(
                              fontSize: 16,
                              color: isExpiredTicket
                                  ? accentColor2
                                  : Color(0xFF6F678E))),
                    ),
                    SizedBox(height: 15),
                    Container(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.5,
                        color: isExpiredTicket
                            ? accentColor2
                            : Colors.transparent)
                  ]),
                ])
              ])),
    ),
        )
      ]));
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TicketView extends StatelessWidget {
  final List<TicketModel> tickets;
  TicketView(this.tickets);
  @override
  Widget build(BuildContext context) {
    var sortedTicket = tickets;
    sortedTicket
        .sort((ticket1, ticket2) => ticket1.time.compareTo(ticket2.time));
    return ListView.builder(
        itemCount: sortedTicket.length,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                context
                    .bloc<PageBloc>()
                    .add(GoToTicketDetailPage(sortedTicket[index]));
              },
              child: Container(
                  margin: EdgeInsets.only(top: index == 0 ? 133 : 20),
                  child: Row(children: [
                    Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(imgUrl +
                                    "w500" +
                                    sortedTicket[index]
                                        .movieDetail
                                        .posterPath)))),
                    SizedBox(width: 16),
                    SizedBox(
                        width: MediaQuery.of(context).size.width -
                            2 * defaultMargin -
                            70 -
                            16,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(sortedTicket[index].movieDetail.title,
                                  style: blackTextFont.copyWith(fontSize: 18),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip),
                              SizedBox(height: 6),
                              Text(
                                  sortedTicket[index]
                                      .movieDetail
                                      .genreAndLanguage,
                                  style: greyTextFont.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(height: 6),
                              Text(sortedTicket[index].theather.name,
                                  style: greyTextFont.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400))
                            ]))
                  ])),
            ));
  }
}
