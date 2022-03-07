part of 'services.dart';

class TransactionServices {
  static CollectionReference transactionCollection =
      Firestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      FluttixTransactionModel transaction) async {
    await transactionCollection.document().setData({
      'userID': transaction.userID,
      'title': transaction.title,
      'subtitle': transaction.subTitle,
       'time' : transaction.time.millisecondsSinceEpoch,
      'amount': transaction.amount,
      'picture': transaction.picture,
     
    });
  }

  static Future<List<FluttixTransactionModel>> getTransaction(
      String userID) async {
    QuerySnapshot snapshot = await transactionCollection.getDocuments();
    var documentS = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    documentS
        .map((e) => FluttixTransactionModel(
            userID: e.data['userID'],
            title: e.data['title'],
            subTitle: e.data['subtitle'],
            time: DateTime.fromMicrosecondsSinceEpoch(e.data['time']),
            amount: e.data['amount'],
            picture: e.data['picture']))
        .toList();
  }
}
