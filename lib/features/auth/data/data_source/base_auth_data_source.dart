abstract class BaseAuthDataSource {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<Map<String, dynamic>> getCurrentUser(String id);
  Future<void> setCurrentUser(String id, Map<String, dynamic> payload);
  Future<void> updateUserProfile(String id, Map<String, dynamic> payload);
}
