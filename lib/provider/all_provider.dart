import 'dart:io';
import 'dart:typed_data';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warranty_watch/provider/auth_provider.dart';
import 'package:warranty_watch/provider/item_provider.dart';
import 'package:warranty_watch/provider/states/auth_states.dart';
import 'package:warranty_watch/repositories/auth_repositories.dart';
import 'package:warranty_watch/repositories/item_repositories.dart';
import 'package:warranty_watch/services/local_storage/key_value_storage.dart';

final keyValueStorageServiceProvider = Provider<KeyValueStorageService>(
  (ref) => KeyValueStorageService(),
);
final _authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
final fileProvier = StateProvider<File?>((ref) {
  return null;
});
final webfileProvier = StateProvider<Uint8List?>((ref) {
  return null;
});
final imageUrl = StateProvider<String?>((ref) {
  return null;
});
final dateProvier = StateProvider<DateTime?>((ref) {
  return DateTime.now();
});
final dropdownvalueProvider = StateProvider<String?>((ref) {
  return 'Komplett.no';
});
final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  final _authRepository = ref.watch(_authRepositoryProvider);
  final _keyValueStorageService = ref.watch(keyValueStorageServiceProvider);
  return AuthProvider(
    ref: ref,
    authRepository: _authRepository,
    keyValueStorageService: _keyValueStorageService,
  );
});
final itemProvider = Provider<ItemProvider>((ref) {
  final _itemRepository = ref.watch(itemRepository);
  return ItemProvider(itemRepository: _itemRepository, ref: ref);
});
final itemRepository = Provider<ItemRepository>((ref) {
  return ItemRepository();
});
