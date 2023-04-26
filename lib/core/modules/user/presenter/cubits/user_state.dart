import '../../domain/entities/user_entity.dart';

abstract class UserState {
  const UserState();
}

class UserAuthenticatedState extends UserState {
  final UserEntity user;

  const UserAuthenticatedState(this.user);
}

class UserUnauthenticatedState extends UserState {
  const UserUnauthenticatedState();
}
