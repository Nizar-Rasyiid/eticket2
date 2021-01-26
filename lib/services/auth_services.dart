part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);
      
      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    }catch (e) {
      return SignInSignUpResult(massage: e.toString());
    }
  }
}

class SignInSignUpResult {
  final User user;
  final String massage;

  SignInSignUpResult({this.user, this.massage});
}