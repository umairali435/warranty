import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warranty_watch/helper/utils/user_defs.dart';
part 'usermodel.g.dart';
part 'usermodel.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel(
      {required String userId,
      required String email,
      required String username}) = _UserModel;
  factory UserModel.fromJson(JSON json) => _$UserModelFromJson(json);
}
