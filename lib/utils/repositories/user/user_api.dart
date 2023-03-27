import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playon/all_utils.dart';

class UserApi implements IUserRepository {
  final CollectionReference<LocalUser> modelsRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<LocalUser>(
        fromFirestore: (snapshot, _) => LocalUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  @override
  Future<LocalUser?> get(String documentId) =>
      modelsRef.doc(documentId).get().then((s) => s.data());

  @override
  Future<List<LocalUser>?> getAll() async {
    final snapshot = await modelsRef.get();
    final docs = snapshot.docs;

    if (docs.isNotEmpty) {
      final List<LocalUser> users = [];
      for (int i = 0; i < docs.length; i++) {
        users.add(docs[i].data());
      }
      return users;
    }
    return null;
  }

  @override
  Future<void> add(LocalUser user) => modelsRef.doc(user.email).set(user);

  @override
  Future<void> update(String documentId, Map<String, dynamic> map) =>
      modelsRef.doc(documentId).update(map);

  @override
  Future<void> delete(String documentId) => modelsRef.doc(documentId).delete();
}
