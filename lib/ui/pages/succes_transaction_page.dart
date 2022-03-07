part of 'pages.dart';

class SuccesTransactionPage extends StatelessWidget {
  final TicketModel tickets;
  final FluttixTransactionModel transaction;

  SuccesTransactionPage(this.tickets, this.transaction);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
          body: FutureBuilder(
              future: tickets != null
                  ? processingTicketOrder(context)
                  : processingTopUp(context),
              builder: (_, snapshot) => (snapshot.connectionState ==
                      ConnectionState.done)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(tickets == null
                                          ? "assets/image/ic_topup.png"
                                          : "assets/image/ic_ticket.png")))),
                          Text(
                              (tickets == null)
                                  ? "Emmm Yummy!"
                                  : "Happy Watching",
                              style: blackTextFont.copyWith(fontSize: 20)),
                          SizedBox(height: 16),
                          Text(
                              (tickets == null)
                                  ? "You have successfully\ntop up the wallet"
                                  : "You have successfully\nbought the ticket",
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w300)),
                          Container(
                            height: 45,
                            width: 250,
                            margin: EdgeInsets.only(top: 70, bottom: 20),
                            child: RaisedButton(
                              color: mainColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                  (tickets == null)
                                      ? "My wallet"
                                      : "My Tickets ",
                                  style: whiteTextFont.copyWith(fontSize: 16)),
                              onPressed: () {
                                if(tickets != null){
                                  context.bloc<PageBloc>().add(GoToTicketPage());
                                }else{
                                  context.bloc<PageBloc>().add(GoToWalletPage(GoToMainPage()));
                                }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Discover new Movie? ",
                                  style: greyTextFont.copyWith(
                                      fontWeight: FontWeight.w400)),
                              GestureDetector(
                                  onTap: () {
                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToMainPage());
                                  },
                                  child: Text("Back to Home",
                                      style: purpleTextFont))
                            ],
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: SpinKitFadingCircle(size: 50, color: mainColor)))),
    );
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(tickets.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(tickets, transaction.userID));

    await TransactionServices.saveTransaction(transaction);
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.bloc<UserBloc>().add(TopUp(transaction.amount));
    await TransactionServices.saveTransaction(transaction);
  }
}
