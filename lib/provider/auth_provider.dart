import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warranty_watch/models/usermodel.dart';
import 'package:warranty_watch/provider/states/auth_states.dart';
import 'package:warranty_watch/repositories/auth_repositories.dart';
import 'package:warranty_watch/routes/app_router.dart';
import 'package:warranty_watch/routes/app_routes.dart';
import 'package:warranty_watch/services/local_storage/key_value_storage.dart';

class AuthProvider extends StateNotifier<AuthState> {
  late UserModel? _currentUser;
  final KeyValueStorageService _keyValueStorageService;
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthProvider(
      {required KeyValueStorageService keyValueStorageService,
      required AuthRepository authRepository,
      required Ref ref})
      : _keyValueStorageService = keyValueStorageService,
        _authRepository = authRepository,
        _ref = ref,
        super(const AuthState.unauthenticated()) {
    init();
  }
  String get currentuserid => _currentUser!.userId;
  String get currentuseremail => _currentUser!.email;
  String get currentusername => _currentUser!.username;
  void init() async {
    _currentUser = _keyValueStorageService.getAuthUser();
    log(_currentUser!.email);
    if (_currentUser == null) {
      // logout();

    } else {
      state = AuthState.authenticated(userId: _currentUser!.userId);
    }
  }

  createUser({String? email, String? password}) async {
    state = const AuthState.authenticating();
    _authRepository.register(email: email, password: password).then((value) {
      print(value);
      if (value is UserCredential) {
        state = AuthState.authenticated(userId: value.user!.uid);
        _keyValueStorageService.setAuthUser(UserModel(
            userId: value.user!.uid,
            email: value.user!.email.toString(),
            username: value.user!.email.toString()));
        AppRouter.pushAndremoveUntill(Routes.watchAllItemScreen);
      } else {
        state = AuthState.failed(reason: value);
      }
    });
  }

  loginUser({String? email, String? password}) async {
    state = const AuthState.authenticating();
    _authRepository.signIn(email: email, password: password).then((value) {
      if (value is UserCredential) {
        state = AuthState.authenticated(userId: value.user!.uid);
        _keyValueStorageService.setAuthUser(UserModel(
            userId: value.user!.uid,
            email: value.user!.email.toString(),
            username: value.user!.email.toString()));
        AppRouter.pushAndremoveUntill(Routes.watchAllItemScreen);
      } else {
        state = AuthState.failed(reason: value);
      }
    });
  }
}
