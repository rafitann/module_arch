import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/modules/user/presenter/cubits/user_state.dart';

import '../../domain/entities/user_entity.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserUnauthenticatedState());

  Future<void> updateUser(UserEntity user) async {
    emit(UserAuthenticatedState(user));
  }

  void logout() {
    emit(const UserUnauthenticatedState());
  }
}
