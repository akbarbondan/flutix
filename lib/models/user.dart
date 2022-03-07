part of 'models.dart';

class ModelUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGendres;
  final String selectedLanguage;
  final int balance;

  ModelUser(this.id, this.email,
      {this.name,
      this.selectedGendres,
      this.profilePicture,
      this.selectedLanguage,
      this.balance});
  ModelUser copyWith({String name, String profilePictureImage, int balance}) =>
      ModelUser(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePictureImage ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedGendres: selectedGendres,
          selectedLanguage: selectedLanguage);

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGendres,
        selectedLanguage,
        balance
      ];
}
