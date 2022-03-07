part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String passworrd, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: passworrd);
      ModelUser user = result.user.convertToUser(
          name: name,
          selectedGenre: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);
      return SignInSignUpResult(user: user);
    } catch (e) {
    return  SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }

  }

  static Future<SignInSignUpResult> signIn(String email, String password) async{
   
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      ModelUser user = await result.user.fromFireStore();
      return SignInSignUpResult(user:user);
    }catch(e){
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }

  }

  static Future<void> signOut()async{
    await _auth.signOut();
  }

  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult{
  final ModelUser user;
 final String message;

 SignInSignUpResult({this.user, this.message});
}