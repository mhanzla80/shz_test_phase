import 'package:playon/all_utils.dart';

abstract class IUserRepository {
  Future<LocalUser?> get(String documentId);
  Future<List<LocalUser>?> getAll();
  Future<void> add(LocalUser user);
  Future<void> update(String documentId, Map<String, dynamic> map);
  Future<void> delete(String documentId);
}
