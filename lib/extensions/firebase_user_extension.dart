part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser({
    String name = "No Name",
    String numberPhone = "0"
  }) => User(this.uid,this.email,
    name: name,
    numberPhone: numberPhone
  );

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid); 
}