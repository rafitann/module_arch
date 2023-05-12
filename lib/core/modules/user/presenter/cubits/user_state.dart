import '../../domain/entities/user_entity.dart';

abstract class UserState {
  const UserState();
}

class UserAuthenticatedState extends UserState {
  const UserAuthenticatedState(this.user);

  final UserEntity user;
}

class UserUnauthenticatedState extends UserState {
  const UserUnauthenticatedState();
}
