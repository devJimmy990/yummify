import 'package:yummify/core/firebase/firebase.dart';
import 'package:yummify/features/auth/data/data_source/base_auth_data_source.dart';

class RemoteAuthDataSource implements BaseAuthDataSource {
  RemoteAuthDataSource(this._firebase);
  final Firebase _firebase;
  @override
  Future<Map<String, dynamic>> getCurrentUser(String id) {
    try {
      return _firebase.store
          .collection('users')
          .doc(id)
          .get()
          .then((doc) => doc.data()!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setCurrentUser(String id, Map<String, dynamic> payload) async {
    try {
      await _firebase.store.collection('users').doc(id).set(payload);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final res = await _firebase.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return res.user?.uid ?? '';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    try {
      return _firebase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final res = await _firebase.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return res.user?.uid ?? '';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserProfile(
    String id,
    Map<String, dynamic> payload,
  ) async {
    try {
      await _firebase.store.collection('users').doc(id).update(payload);
    } catch (e) {
      rethrow;
    }
  }
}
