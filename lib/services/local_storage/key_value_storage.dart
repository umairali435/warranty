import 'dart:convert';

import 'package:warranty_watch/helper/utils/user_defs.dart';
import 'package:warranty_watch/models/usermodel.dart';
import 'package:warranty_watch/services/local_storage/key_value_storage_base.dart';

class KeyValueStorageService {
  final _keyValueStorage = KeyValueStorageBase.instance;
  static const _AuthUserKey = "authUserKey";
  UserModel? getAuthUser() {
    final user = _keyValueStorage.getCommon<String>(_AuthUserKey);
    if (user == null) return null;
    return UserModel.fromJson(jsonDecode(user) as JSON);
  }

  void setAuthUser(UserModel user) {
    _keyValueStorage.setCommon<String>(_AuthUserKey, jsonEncode(user.toJson()));
  }
}
