part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  ModelUser convertToUser(
          {String name = 'NO Name',
          List<String> selectedGenre = const [],
          String selectedLanguage = "English",
          int balance = 500000}) =>
      ModelUser(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGendres: selectedGenre,
          selectedLanguage: selectedLanguage);


Future<ModelUser> fromFireStore() async => await UserServices.getUser(uid);

}


