import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_fllutix/bloc/blocs.dart';
import 'package:bwa_fllutix/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if(event is GoToSplashPage){
      yield OnSplashPage();
    }else if(event is GoToLoginPage){
      yield OnLoginPage();
    }else if(event is GoToMainPage){
      yield OnMainPage();
    }else if(event is GoToSignUpPage){
      yield OnSignUpPage(event.registrationData);
    }else if(event is GoToPreferencePage){
      yield OnPreferencePage(event.registrationData);
    }else if(event is GoToConfirmationPage){
      yield OnConfirmationPage(event.registrationData);
    }else if(event is GoToMovieDetailPage){
      yield OnMovieDetailPage(event.movie);
    }else if(event is GoToSelectShecdulePage){
      yield OnSelectShecdulePage(event.movieDetail);
    }else if( event is GoToSelectSeatsPage){
      yield OnSelectSeatsPage(event.tickets);
    }else if(event is GoToCheckOutPage){
      yield OnCheckOutPage(event.tickets);
    }else if(event is GoToSuccesTransactionPage){
      yield OnSuccessPage(event.tickets, event.transaction);
    }else if(event is GoToTicketPage){
      yield OnTicketPage();
    }else if(event is GoToTicketDetailPage){
      yield OnTicketDetailPage(event.tickets);
    } else if(event is GoToProfilePage){
      yield OnProfilePage();
    }else if(event is GoToTopUpPage){
      yield OnTopupPage(event.pageEvent);
    }else if(event is GoToWalletPage){
      yield OnWalletPage(event.pageEvent);
    }
  }

  
}
