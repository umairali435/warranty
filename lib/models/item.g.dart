// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      purchaseDate: json['purchaseDate'] as String,
      purchaseStore: json['purchaseStore'] as String,
      warrantyTime: json['warrantyTime'] as String,
      claimTime: json['claimTime'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'purchaseDate': instance.purchaseDate,
      'purchaseStore': instance.purchaseStore,
      'warrantyTime': instance.warrantyTime,
      'claimTime': instance.claimTime,
    };
