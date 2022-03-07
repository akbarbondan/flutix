part of 'models.dart';
class TheaterModel extends Equatable{
  final String name;
  TheaterModel(this.name);
  @override
  // TODO: implement props
  List<Object> get props => [name];

}

List<TheaterModel> dummyTheaters = [
    TheaterModel("CGV Transmart Yogyakarta"),
     TheaterModel("XXI Hartono Mall"),
      TheaterModel("XXI Paris Van Java"),
       TheaterModel("XXI Yogyakarta")

];