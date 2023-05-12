import '/core/modules/user/domain/entities/user_entity.dart';
import '/module/auth/data/datasources/interfaces/user_datasource.dart';

import '../../../../../core/shared/services/firestore/firestore_service.dart';
import '../../mappers/user_mapper.dart';

class UserDatasourceImpl implements UserDatasource {
  const UserDatasourceImpl(this._firestoreService);
  final FirestoreService _firestoreService;

  @override
  Future<UserEntity> getUserByID(String userID) async {
    final response = await _firestoreService.getByID('users', userID);

    final user = UserMapper.fromMap(response);

    return user;
  }
}
