part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
 
}

class OnInitialPage extends PageState {
   
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
   
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
   
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
   
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState{
  final RegistrationData registrationData;
  OnSignUpPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnConfirmationPage extends PageState{
  final RegistrationData registrationData;
  OnConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnPreferencePage extends PageState{
  final RegistrationData registrationData;
  OnPreferencePage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnMovieDetailPage extends PageState{
  final ModelMovie movie;
  OnMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];

}

class OnSelectShecdulePage extends PageState{
  final ModelMovieDetail movieDetail;
  OnSelectShecdulePage(this.movieDetail);
  @override
  // TODO: implement props
  List<Object> get props => [movieDetail];
  
}

class OnSelectSeatsPage extends PageState{
 final TicketModel tickets;
 OnSelectSeatsPage(this.tickets);
  List<Object> get props => [tickets];

}

class OnCheckOutPage extends PageState{
 final TicketModel tickets;
 OnCheckOutPage(this.tickets);
  List<Object> get props => [tickets];

}

class OnSuccessPage extends PageState{
  final TicketModel tickets;
  final FluttixTransactionModel transaction;

  OnSuccessPage(this.tickets, this.transaction);

  @override
  List<Object> get props => [tickets, transaction];
}

class OnTicketPage extends PageState{
  @override
  List<Object> get props => [];
}

class OnTicketDetailPage extends PageState{
 final TicketModel tickets;
 OnTicketDetailPage(this.tickets);
  List<Object> get props => [tickets];

}


class OnProfilePage extends PageState{
  @override
  List<Object> get props => [];
}


class OnTopupPage extends PageState{
  final PageEvent pageEvent;
  OnTopupPage(this.pageEvent);
  @override
  List<Object> get props => [pageEvent];

}

class OnSuccesPage extends PageState{
  @override
  
  List<Object> get props => throw UnimplementedError();

}

class OnWalletPage extends PageState{
  final PageEvent pageEvent;
  OnWalletPage(this.pageEvent);

  @override
  // TODO: implement props
  List<Object> get props => [pageEvent];
}