import '../repositories/user_firestore_repository.dart';
import '../models/user.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  void saveUser(User user) {
    _userRepository.saveUser(user);
  }
}
