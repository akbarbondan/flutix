part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prefPageEvent is GoToSplashPage)) {
        prefPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prefPageEvent);
      }
    } else {
      if (!(prefPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUserEvent(firebaseUser.uid));
        context.bloc<TicketBloc>().add(GetTickets(firebaseUser.uid));
        prefPageEvent = GoToMainPage();

        context.bloc<PageBloc>().add(prefPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashPage)
          ? SplashPage()
          : (pageState is OnLoginPage)
              ? SignInPage()
              : (pageState is OnSignUpPage)
                  ? SignUpPage(pageState.registrationData)
                  : (pageState is OnConfirmationPage)
                      ? AccountConfirmationPage(pageState.registrationData)
                      : (pageState is OnPreferencePage)
                          ? PreferencePage(pageState.registrationData)
                          : (pageState is OnMovieDetailPage)
                              ? MovieDetailPage(pageState.movie)
                              : (pageState is OnSelectShecdulePage)
                                  ? SelectShedulePage(pageState.movieDetail)
                                  : (pageState is OnSelectSeatsPage)
                                      ? SelectSeatPage(pageState.tickets)
                                      : (pageState is OnCheckOutPage)
                                          ? CheckOutPage(pageState.tickets)
                                          : (pageState is OnSuccessPage)
                                              ? SuccesTransactionPage(
                                                  pageState.tickets,
                                                  pageState.transaction)
                                              : (pageState is OnTicketPage)
                                                  ? TicketPage()
                                                  : (pageState
                                                          is OnTicketDetailPage)
                                                      ? TicketDetailPage(
                                                          pageState.tickets)
                                                      : (pageState
                                                              is OnTopupPage)
                                                          ? TopUpPage(pageState
                                                              .pageEvent)
                                                          : (pageState
                                                                  is OnProfilePage)
                                                              ? ProfilePage()
                                                              : (pageState
                                                                      is OnWalletPage)
                                                                  ? WalletPage(
                                                                      pageState
                                                                          .pageEvent)
                                                                  : MainPage(),
    );
  }
}
