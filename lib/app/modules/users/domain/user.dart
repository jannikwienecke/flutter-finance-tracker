import 'package:notes/app/modules/users/domain/username.dart';
import 'package:notes/app/shared/domain/AggregatRoot.dart';
import 'package:notes/app/shared/domain/Uuid.dart';

class UserProps {
  UserProps({
    required this.username,
    // required this.email,
    // required this.password,
  });

  final Username username;
  // final String email;
  // final String password;
}

class User extends AggregatRoot<UserProps> {
  User._({
    required super.entityProps,
    required UuidId super.id,
  });

  @override
  UserProps get entityProps => super.entityProps;

  Username get username => entityProps.username;

  factory User.create({
    required Username username,
    // required String email,
    // required String password,
  }) {
    return User._(
      id: UuidId(),
      entityProps: UserProps(
        username: username,
        // email: email,
        // password: password,
      ),
    );
  }
}
