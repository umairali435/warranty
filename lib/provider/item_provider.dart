import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warranty_watch/models/item.dart';
import 'package:warranty_watch/provider/all_provider.dart';
import 'package:warranty_watch/provider/states/image_state.dart';
import 'package:warranty_watch/provider/states/item_state.dart';
import 'package:warranty_watch/repositories/item_repositories.dart';

final itemStateProvider = StateProvider<ItemState>((ref) {
  return const ItemState.notGet();
});
final imageStateProvider = StateProvider<ImageState>((ref) {
  return ImageState.notuploaded();
});
final getItemProvider = FutureProvider.autoDispose((ref) async {
  final _userId = ref.watch(authProvider.notifier).currentuserid;
  final itemprovider = ref.watch(itemProvider);
  return await itemprovider.getAllItem(id: _userId);
});

class ItemProvider {
  final ItemRepository _itemRepository;
  final Ref _ref;
  ItemProvider({required ItemRepository itemRepository, required Ref ref})
      : _itemRepository = itemRepository,
        _ref = ref,
        super();

  Future<List<Item>> getAllItem({String? id}) async {
    return await _itemRepository.retriveItem(userId: id);
  }

  Future<String> addItem({String? userId, Item? item}) async {
    final itemState = _ref.read(itemStateProvider.state);
    itemState.state = const ItemState.isGetting();
    try {
      return await _itemRepository.createItem(userId: userId, item: item);
    } catch (e) {
      itemState.state = ItemState.failed(reason: e.toString());
      return e.toString();
    }
  }

  Future<String> addImage({File? path}) async {
    final itemState = _ref.read(imageStateProvider.state);
    itemState.state = const ImageState.uploading();
    try {
      return await _itemRepository.uploadImageToFirebase(imagePath: path);
    } catch (e) {
      return e.toString();
    }
  }
}
