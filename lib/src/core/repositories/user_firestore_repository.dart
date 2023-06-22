import '../models/user.dart';

abstract class UserRepository {
  void saveUser(User user);
}

class FirestoreUserRepository implements UserRepository {
  @override
  void saveUser(User user) {
    // Implementación específica para guardar un usuario en Firebase Firestore
  }
}
