import 'package:flutter/material.dart';
import 'package:warranty_watch/helper/constants.dart';
import 'package:warranty_watch/models/item.dart';
import 'package:warranty_watch/widget/cached_network_image.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({this.item, this.callback});

  final VoidCallback? callback;
  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: callback,
        child: Container(
          decoration: BoxDecoration(
            color: Constants.whiteColor,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 16,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2,
                      child: CustomNetworkImage(
                        placeholder: Center(child: CircularProgressIndicator()),
                        borderRadius: BorderRadius.zero,
                        imageUrl: item!.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Name : " + item!.name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Purchase Date :" + item!.purchaseDate,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                    Text(
                                      "Purchase Store :" + item!.purchaseStore,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                    Text(
                                      "Warranty Time :" + item!.warrantyTime,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                    Text(
                                      "Claim Time :" + item!.claimTime,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.withOpacity(0.8)),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
