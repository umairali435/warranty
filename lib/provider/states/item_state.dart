import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_state.freezed.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.notGet() = NOTGET;
  const factory ItemState.isGetting() = ISGETTING;
  const factory ItemState.itemGetted() = ITEMGETTED;
  const factory ItemState.failed({required String reason}) = FAILED;
}
