import 'package:yummify/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:yummify/features/auth/data/model/user.dart';

class AuthRepository {
  AuthRepository(this._dataSource);
  final BaseAuthDataSource _dataSource;

  Future<String> login(String email, String password) async {
    try {
      return await _dataSource.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> register(String email, String password) async {
    try {
      return await _dataSource.signUpWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _dataSource.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getCurrentUser(String id) async {
    try {
      final data = await _dataSource.getCurrentUser(id);
      return User.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setCurrentUser(
    String id, {
    required Map<String, dynamic> payload,
  }) async {
    try {
      await _dataSource.setCurrentUser(id, payload);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUserProfile(
    String id, {
    required Map<String, dynamic> payload,
  }) async {
    try {
      await _dataSource.updateUserProfile(id, payload);
    } catch (e) {
      rethrow;
    }
  }
}
