part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final int discount;
  final String subtitle;
  Promo(
      {@required this.title, @required this.subtitle, @required this.discount});
  @override
  // TODO: implement props
  List<Object> get props => [title, discount, subtitle];
}

List<Promo> dummyPromos = [
  Promo(
      title: "Student Holiday",
      discount: 50,
      subtitle: "Maximal only for two people"),
  Promo(
      title: "Student Holiday",
      discount: 50,
      subtitle: "Maximal only for two people"),
  Promo(
      title: "Student Holiday",
      discount: 50,
      subtitle: "Maximal only for two people"),
  Promo(
      title: "Student Holiday",
      discount: 50,
      subtitle: "Maximal only for two people"),
];
