// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

  _Item call(
      {required String imageUrl,
      required String name,
      required String purchaseDate,
      required String purchaseStore,
      required String warrantyTime,
      required String claimTime}) {
    return _Item(
      imageUrl: imageUrl,
      name: name,
      purchaseDate: purchaseDate,
      purchaseStore: purchaseStore,
      warrantyTime: warrantyTime,
      claimTime: claimTime,
    );
  }

  Item fromJson(Map<String, Object?> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String get imageUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get purchaseDate => throw _privateConstructorUsedError;
  String get purchaseStore => throw _privateConstructorUsedError;
  String get warrantyTime => throw _privateConstructorUsedError;
  String get claimTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String imageUrl,
      String name,
      String purchaseDate,
      String purchaseStore,
      String warrantyTime,
      String claimTime});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? purchaseDate = freezed,
    Object? purchaseStore = freezed,
    Object? warrantyTime = freezed,
    Object? claimTime = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseStore: purchaseStore == freezed
          ? _value.purchaseStore
          : purchaseStore // ignore: cast_nullable_to_non_nullable
              as String,
      warrantyTime: warrantyTime == freezed
          ? _value.warrantyTime
          : warrantyTime // ignore: cast_nullable_to_non_nullable
              as String,
      claimTime: claimTime == freezed
          ? _value.claimTime
          : claimTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String imageUrl,
      String name,
      String purchaseDate,
      String purchaseStore,
      String warrantyTime,
      String claimTime});
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? purchaseDate = freezed,
    Object? purchaseStore = freezed,
    Object? warrantyTime = freezed,
    Object? claimTime = freezed,
  }) {
    return _then(_Item(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: purchaseDate == freezed
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseStore: purchaseStore == freezed
          ? _value.purchaseStore
          : purchaseStore // ignore: cast_nullable_to_non_nullable
              as String,
      warrantyTime: warrantyTime == freezed
          ? _value.warrantyTime
          : warrantyTime // ignore: cast_nullable_to_non_nullable
              as String,
      claimTime: claimTime == freezed
          ? _value.claimTime
          : claimTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {required this.imageUrl,
      required this.name,
      required this.purchaseDate,
      required this.purchaseStore,
      required this.warrantyTime,
      required this.claimTime});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final String purchaseDate;
  @override
  final String purchaseStore;
  @override
  final String warrantyTime;
  @override
  final String claimTime;

  @override
  String toString() {
    return 'Item(imageUrl: $imageUrl, name: $name, purchaseDate: $purchaseDate, purchaseStore: $purchaseStore, warrantyTime: $warrantyTime, claimTime: $claimTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Item &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.purchaseDate, purchaseDate) &&
            const DeepCollectionEquality()
                .equals(other.purchaseStore, purchaseStore) &&
            const DeepCollectionEquality()
                .equals(other.warrantyTime, warrantyTime) &&
            const DeepCollectionEquality().equals(other.claimTime, claimTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(purchaseDate),
      const DeepCollectionEquality().hash(purchaseStore),
      const DeepCollectionEquality().hash(warrantyTime),
      const DeepCollectionEquality().hash(claimTime));

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required String imageUrl,
      required String name,
      required String purchaseDate,
      required String purchaseStore,
      required String warrantyTime,
      required String claimTime}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get imageUrl;
  @override
  String get name;
  @override
  String get purchaseDate;
  @override
  String get purchaseStore;
  @override
  String get warrantyTime;
  @override
  String get claimTime;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}
