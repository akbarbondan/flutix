part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final ModelCredit credit;
  CreditCard(this.credit);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 80,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: (credit.profilePath != null)
                  ? DecorationImage(
                      image:
                          NetworkImage(imgUrl + "w185" + credit.profilePath),
                      fit: BoxFit.cover)
                  : null)),
      Container(
          margin: EdgeInsets.only(top: 6),
          width: 70,
          child: Text(
            credit.name,
            style: blackTextFont.copyWith(
                fontSize: 10, fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          )),
    ]);
  }
}
