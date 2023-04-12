import '../../domain/entities/user_entity.dart';

class UserMapper {
  const UserMapper._();

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      email: map['email'],
      name: map['name'],
    );
  }
}
