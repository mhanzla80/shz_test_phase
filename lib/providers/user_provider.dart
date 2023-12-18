import 'package:firebase_auth/firebase_auth.dart';
import 'package:playon/all_utils.dart';

class UserProvider extends ChangeNotifier {
  LocalUser? user = storage.user;

  void updateUser(LocalUser user) {
    this.user = user;
    storage.setUser(user);
    notifyListeners();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    user = null;
    storage.removeUser();
    notifyListeners();
  }
}
