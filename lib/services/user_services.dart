part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('user');

  static Future<void> updateUser(ModelUser user) async {
    /// simpan data ke firebase firestore
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGendres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<ModelUser> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();
    return ModelUser(id, snapshot.data['email'],
        name: snapshot.data['name'],
        balance: snapshot.data['balance'],
        selectedGendres: (snapshot.data['selectedGenres'] as List).map((e) => e.toString()).toList(),
        selectedLanguage: snapshot.data['selectedLanguage'],
        profilePicture: snapshot.data['profilePicture']);
  }
}
