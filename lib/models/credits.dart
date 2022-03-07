part of'models.dart';

class ModelCredit extends Equatable {
  final String name;
  final String profilePath;

  ModelCredit({this.name, this.profilePath});
  @override
  List<Object> get props => [name, profilePath];
}
