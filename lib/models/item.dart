import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warranty_watch/helper/utils/user_defs.dart';
part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String imageUrl,
    required String name,
    required String purchaseDate,
    required String purchaseStore,
    required String warrantyTime,
    required String claimTime,
  }) = _Item;
  factory Item.empty() => Item(
      imageUrl: '',
      name: '',
      purchaseDate: '',
      purchaseStore: '',
      warrantyTime: '',
      claimTime: '');
  factory Item.fromJson(JSON json) => _$ItemFromJson(json);
  // factory Item.fromDocument(DocumentSnapshot doc) {
  //   final data = doc.data()!;
  //   return Item.fromJson(data);
  // }
}
