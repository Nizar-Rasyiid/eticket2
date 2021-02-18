part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final String numberPhone;

  User(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.numberPhone});

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        numberPhone
      ];
}
