part of 'widgets.dart';

class TransactionCard extends StatelessWidget {
  final FluttixTransactionModel transaction;
  final double width;

  TransactionCard(this.transaction, this.width);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 90,
          width: 70,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage( fit: BoxFit.cover,
                  image: (transaction.picture != null)
                      ? NetworkImage(imgUrl + "w500" + transaction.picture)
                      : AssetImage("assets/image/ic_card_topup.png"))),
        ),
        Column(
          children: [
            SizedBox(
              width: width - 86,
              child: Text(transaction.title,
                  style: blackTextFont.copyWith(
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.clip),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: width - 86,
              child: Text(
                NumberFormat.currency(
                        decimalDigits: 0, symbol: 'IDR', locale: 'id_ID')
                    .format(transaction.amount < 0
                        ? -transaction.amount
                        : transaction.amount),
                style: whiteTextFont.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: transaction.amount < 0
                      ? Color(0xFFFF5C83)
                      : Color(0xFF3E9D9D),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: width - 86,
              child: Text(transaction.subTitle,
                  style: greyTextFont.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400)),
            )
          ],
        )
      ],
    );
  }
}
