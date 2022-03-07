part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      Firestore.instance.collection('tickets');

  static Future<void> saveTickets(String id, TicketModel ticket) async {
    await ticketCollection.document().setData({
      'movieID': ticket.movieDetail.id ?? "",
      'userID': id ?? "",
      'theaterName': ticket.theather.name ?? 0,
      'time': ticket.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<TicketModel>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.getDocuments();
    var documentS = snapshot.documents
        .where((document) => document.data['userID'] == userId);

    List<TicketModel> tickets = [];
    for (var document in documentS) {
      ModelMovieDetail movieDetail =
          await MoiveServices.getDetailMovie(null, movieID: document.data['movieID']);
      tickets.add(TicketModel(
          movieDetail,
          TheaterModel(document.data['theaterName']),
          DateTime.fromMicrosecondsSinceEpoch(document.data['time']),
          document.data['bookingCode'],
          document.data['seats'].toString().split(','),
          document.data['name'],
          document.data['totalPrice']));
    }
    return tickets;
  }
}
