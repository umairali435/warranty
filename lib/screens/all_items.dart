import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:warranty_watch/helper/constants.dart';
import 'package:warranty_watch/models/item.dart';
import 'package:warranty_watch/provider/all_provider.dart';
import 'package:warranty_watch/provider/item_provider.dart';
import 'package:warranty_watch/routes/app_router.dart';
import 'package:warranty_watch/routes/app_routes.dart';
import 'package:warranty_watch/widget/all_item_widget_list.dart';
import 'package:warranty_watch/helper/extensions/context_extention.dart';
import 'package:warranty_watch/widget/item_widget_loader.dart';

class AllItems extends HookConsumerWidget {
  const AllItems();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allItems = ref.watch(getItemProvider);
    List<Item> newList = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text('All Items'),
      ),
      body: Column(
        children: [
          Expanded(
            child: allItems.when(
              data: ((data) {
                newList.insertAll(0, data);
                if (kIsWeb) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: newList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemListWidget(
                        item: newList[index],
                        callback: () {
                          ref.refresh(getItemProvider);
                        },
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: newList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemListWidget(
                        item: newList[index],
                        callback: () {
                          ref.refresh(getItemProvider);
                        },
                      );
                    },
                  );
                }
              }),
              error: (err, st) => Container(),
              loading: () => kIsWeb
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return MoviesSkeletonLoader();
                      },
                    )
                  : ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return MoviesSkeletonLoader();
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.pushNamed(Routes.watchAddItemScreen);
        },
        child: Icon(
          Icons.add,
          size: 22,
          color: Constants.whiteColor,
        ),
      ),
    );
  }
}
