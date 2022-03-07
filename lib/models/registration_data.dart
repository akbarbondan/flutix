part of'models.dart';
class RegistrationData {
  String name;
  String email;
  String password;
  String selectedLanguage;
  File profilePictureImage;
  List<String> selectedGeres;

  RegistrationData(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.selectedLanguage = "",
      this.profilePictureImage,
      this.selectedGeres = const []});
}
