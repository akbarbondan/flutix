import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_fllutix/models/models.dart';
import 'package:bwa_fllutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketState get initialState => TicketState([]);

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if (event is BuyTicket) {
      await TicketServices.saveTickets(event.userID, event.tickets);
      List<TicketModel> tickets = state.tickets + [event.tickets];
      yield TicketState(tickets);
    } else if (event is GetTickets) {
      List<TicketModel> tickets = await TicketServices.getTickets(event.userID);
      yield TicketState(tickets);
    }
  }
}
