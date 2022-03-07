part of 'models.dart';

class TicketModel extends Equatable {
  final ModelMovieDetail movieDetail;
  final TheaterModel theather;
  final DateTime time;
  final String bookingCode;
  final List<String> seats;
  final String name;
  final int totalPrice;
  TicketModel(this.movieDetail, this.theather, this.time, this.bookingCode,
      this.seats, this.name, this.totalPrice);

  TicketModel copyWith(
          {ModelMovieDetail movieDetail,
          TheaterModel theater,
          DateTime time,
          String bookingCode,
          List<String> seats,
          String name,
          int totalPrice}) =>
      TicketModel(
          movieDetail ?? this.movieDetail,
          theater ?? this.theather,
          time ?? this.time,
          bookingCode ?? this.bookingCode,
          seats ?? this.seats,
          name ?? this.name,
          totalPrice ?? this.totalPrice);

  String get seatsInString {
    String s = '';
    for (var seat in seats) {
      s += seat + ((seat != seats.last) ? ", " : "");
    }
    return s;
  }

  List<Object> get props =>
      [movieDetail, theather, time, bookingCode, seats, name, totalPrice];
}
