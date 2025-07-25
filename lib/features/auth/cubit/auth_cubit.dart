import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:yummify/features/auth/data/model/user.dart';
import 'package:yummify/features/auth/data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this._repository) : super(AuthInitial()) {
    emit(AuthInitial());
  }

  final AuthRepository _repository;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result = await _repository.login(email, password);
      _getUserData(result);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(Map<String, dynamic> payload) async {
    emit(AuthLoading());
    try {
      final result = await _repository.register(
        payload['email'],
        payload['password'],
      );
      _setUserData(result, payload, payload['password']);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _repository.logout();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> updateProfile(Map<String, dynamic> payload) async {
    if (state is Authenticated) {
      final currentUser = (state as Authenticated).user;
      emit(AuthLoading());

      try {
        await _repository.updateUserProfile(currentUser.id, payload: payload);
        emit(Authenticated(currentUser.copyWith(payload)));
      } catch (e) {
        emit(AuthError(e.toString()));
        return;
      }
    }
  }

  Future<void> _getUserData(String id) async {
    try {
      final user = await _repository.getCurrentUser(id);
      emit(Authenticated(user));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _setUserData(
    String id,
    Map<String, dynamic> payload,
    String password,
  ) async {
    try {
      payload.remove('password');
      await _repository.setCurrentUser(id, payload: {'id': id, ...payload});
      emit(AccountCreated(payload['email'], password));
    } catch (e) {
      rethrow;
    }
  }

  bool get isAuthenticated => state is Authenticated;
  User? get currentUser {
    if (state is Authenticated) {
      return (state as Authenticated).user;
    }
    return null;
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('user')) {
      return Authenticated(User.fromJson(json['user']));
    }
    return Unauthenticated();
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is Authenticated) {
      return {"user": state.user.toJson()};
    }
    return null;
  }
}
