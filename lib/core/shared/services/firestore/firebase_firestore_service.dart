import 'firestore_service.dart';

class FirebaseFirestoreService implements FirestoreService {
  @override
  Future<Map<String, dynamic>> getByID(String key, String id) async {
    return {
      'id': 'abc',
      'name': 'Daniel Fernandes',
      'email': 'daniel.noronha@fteam.dev',
    };
  }
}
