part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

}

class GetTickets extends TicketEvent{
 final String userID;
 GetTickets(this.userID);
  List<Object> get props => [userID];

}

class BuyTicket extends TicketEvent{
  final TicketModel tickets;
  final String userID;

  BuyTicket(this.tickets, this.userID);
  List<Object> get props => [tickets, userID];
}