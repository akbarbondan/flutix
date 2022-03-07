part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToMainPage extends PageEvent {
  final int bottomNavBarIndex;
  final bool isExpired;
  GoToMainPage({this.bottomNavBarIndex, this.isExpired});
  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  final RegistrationData registrationData;
  GoToSignUpPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;
  GoToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToConfirmationPage extends PageEvent {
  final RegistrationData registrationData;
  GoToConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToMovieDetailPage extends PageEvent {
  final ModelMovie movie;
  GoToMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class GoToSelectShecdulePage extends PageEvent {
  final ModelMovieDetail movieDetail;
  GoToSelectShecdulePage(this.movieDetail);
  @override
  // TODO: implement props
  List<Object> get props => [movieDetail];
}

class GoToSelectSeatsPage extends PageEvent {
  final TicketModel tickets;
  GoToSelectSeatsPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class GoToCheckOutPage extends PageEvent {
  final TicketModel tickets;
  GoToCheckOutPage(this.tickets);
  @override
  List<Object> get props => [tickets];
}

class GoToSuccesTransactionPage extends PageEvent {
  final TicketModel tickets;
  final FluttixTransactionModel transaction;
  GoToSuccesTransactionPage(this.tickets, this.transaction);
  List<Object> get props => [this.tickets, this.transaction];
}

class GoToTicketPage extends PageEvent{
  @override
  List<Object> get props => [];
}

class GoToTicketDetailPage extends PageEvent{
 final TicketModel tickets;
 GoToTicketDetailPage(this.tickets);
  List<Object> get props => [tickets];

}

class GoToProfilePage extends PageEvent{
 
  List<Object> get props => [];
}

class GoToTopUpPage extends PageEvent{
  final PageEvent pageEvent;
  GoToTopUpPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];

}

class GoToWalletPage extends PageEvent{
  final PageEvent pageEvent;
  GoToWalletPage(this.pageEvent);
  @override

  List<Object> get props => [pageEvent];
  
}

