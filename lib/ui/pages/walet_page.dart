part of 'pages.dart';

class WalletPage extends StatelessWidget {
  final PageEvent pageEvent;
  WalletPage(this.pageEvent);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(pageEvent);
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 0),
                child: ListView(children: [
                  Stack(children: [
                    GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(pageEvent);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black)),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) {
                        return Column(children: [
                          Text("My Wallet",
                              style: blackTextFont.copyWith(fontSize: 24)),
                          Container(
                              height: 185,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF382A74),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                      offset: Offset(0, 5),
                                    )
                                  ]),
                              child: Stack(
                                children: [
                                  ClipPath(
                                    clipper: CardRefliectionCliper(),
                                    child: Container(
                                        height: 185,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomRight,
                                                end: Alignment.topLeft,
                                                colors: [
                                                  Colors.white.withOpacity(0.1),
                                                  Colors.white.withOpacity(0)
                                                ]))),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 4),
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFFF2CB),
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: accentColor2,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                              NumberFormat.currency(
                                                      locale: 'id_ID',
                                                      symbol: 'IDR',
                                                      decimalDigits: 0)
                                                  .format((userState
                                                          as UserLoadState)
                                                      .user
                                                      .balance),
                                              style: whiteNumberFont.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                          Row(children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Card Holder",
                                                      style: whiteTextFont
                                                          .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                  Row(children: [
                                                    Text(
                                                        (userState
                                                                as UserLoadState)
                                                            .user
                                                            .name
                                                            .toUpperCase(),
                                                        style: whiteTextFont
                                                            .copyWith(
                                                                fontSize: 12)),
                                                    SizedBox(width: 4),
                                                    SizedBox(
                                                        height: 14,
                                                        width: 14,
                                                        child: Image.asset(
                                                            'assets/image/btn.verf.png'))
                                                  ])
                                                ]),
                                            SizedBox(width: 30),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Card Holder",
                                                      style: whiteTextFont
                                                          .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                  Row(children: [
                                                    Text(
                                                        (userState
                                                                as UserLoadState)
                                                            .user
                                                            .id
                                                            .substring(0, 10)
                                                            .toUpperCase(),
                                                        style: whiteTextFont
                                                            .copyWith(
                                                                fontSize: 12)),
                                                    SizedBox(width: 4),
                                                    SizedBox(
                                                        height: 14,
                                                        width: 14,
                                                        child: Image.asset(
                                                            'assets/image/btn.verf.png'))
                                                  ])
                                                ]),
                                          ])
                                        ],
                                      )),
                                ],
                              )),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text("Recent Transaction", style: blackTextFont)),

                                SizedBox(height:12),
                                FutureBuilder(future: TransactionServices.getTransaction((userState as UserLoadState).user.id),
                                builder: (_, snapShot){
                                    if(snapShot.hasData){
                                      return generateTransactionList(snapShot.data, MediaQuery.of(context).size.width - 2 * defaultMargin);
                                    }else{
                                      return SpinKitFadingCircle(size:50, color:mainColor);
                                    }
                                }
                                )
                        ]);
                      },
                    )
                  ])
                ]))
            // note: Button
          ],
        ),
      ),
    );
  }
  Column generateTransactionList(List<FluttixTransactionModel>transaction, double width){
  
    return Column(children: transaction.map((transaksi) => Padding(
      padding: EdgeInsets.only(bottom:12),
      child: TransactionCard(transaksi, width))).toList());
  }
}

class CardRefliectionCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 15);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
