import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warranty_watch/helper/constants.dart';
import 'package:warranty_watch/helper/size.dart';
import 'package:warranty_watch/helper/utils/form_validator.dart';
import 'package:warranty_watch/helper/utils/image_source.dart';
import 'package:warranty_watch/models/item.dart';
import 'package:warranty_watch/provider/all_provider.dart';
import 'package:warranty_watch/helper/extensions/context_extention.dart';
import 'package:warranty_watch/provider/item_provider.dart';
import 'package:warranty_watch/provider/states/image_state.dart';
import 'package:warranty_watch/provider/states/item_state.dart';
import 'package:warranty_watch/routes/app_router.dart';
import 'package:warranty_watch/routes/app_routes.dart';
import 'package:warranty_watch/widget/common/custom_button.dart';
import 'package:warranty_watch/widget/custom_text_field.dart';

class AddItem extends HookConsumerWidget {
  File? file;
  Uint8List webImage = Uint8List(10);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final formKey = GlobalKey<FormState>();
    final _userId = ref.watch(authProvider.notifier).currentuserid;
    final nameController = useTextEditingController(text: '');
    final purchaseDateController = useTextEditingController(text: '');
    final warrantyTimeController = useTextEditingController(text: '');
    final clainTimeController = useTextEditingController(text: '');
    final dropdownvalue = ref.read(dropdownvalueProvider);
    final imageState = ref.watch(imageStateProvider);
    final fileurl = ref.watch(fileProvier);
    final webfileurl = ref.watch(webfileProvier);
    final networkUrl = ref.watch(imageUrl);
    void onItemGetPosted() {
      nameController.clear();
      purchaseDateController.clear();
      warrantyTimeController.clear();
      clainTimeController.clear();
      ref.watch(fileProvier.state).update((state) => null);
      ref.watch(imageUrl.state).update((state) => null);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text(
          'Add Item',
          style: context.headline6.copyWith(color: Constants.whiteColor),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              _imageView(context, ref, fileurl, webfileurl),
              _AddItemDetailFields(
                nameController: nameController,
                purchaseController: purchaseDateController,
                claimTimeController: clainTimeController,
                warrantytimeController: warrantyTimeController,
              ),
              CustomTextButton(
                height: size.convert(context, 60),
                width: double.infinity,
                child: Center(
                  child: Consumer(
                    builder: ((context, ref, child) {
                      final itemState = ref.watch(itemStateProvider);
                      if (itemState is ISGETTING) {
                        return CupertinoActivityIndicator();
                      }
                      return child!;
                    }),
                    child: Text(
                      'Add Item',
                      style: context.bodyText1.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (imageState is UPLOADING) return;
                    ref
                        .read(itemProvider)
                        .addItem(
                          userId: _userId,
                          item: Item(
                              imageUrl: networkUrl!,
                              name: nameController.text,
                              purchaseDate: purchaseDateController.text,
                              purchaseStore: dropdownvalue!,
                              warrantyTime: warrantyTimeController.text,
                              claimTime: clainTimeController.text),
                        )
                        .then((value) {
                      ref
                          .read(itemStateProvider.state)
                          .update((state) => ItemState.notGet());
                      ref.watch(getItemProvider);
                      onItemGetPosted();
                      ref.refresh(itemProvider);
                      AppRouter.pop();
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageView(
      context, WidgetRef ref, File? fileurl, Uint8List? webfileUrl) {
    final itemState = ref.watch(imageStateProvider);
    return Center(
      child: InkWell(
        onTap: () async {
          if (itemState is UPLOADING) return;

          if (ref.read(fileProvier) != null) {
            ref.read(fileProvier.state).update((state) => null);
          }
          if (kIsWeb) {
            final result =
                await ImageSourcePicker.pickFile(ImageSource.gallery);
            if (result != null) {
              await result.readAsBytes().then((value) {
                print(value);
              });
              ref.read(itemProvider).addImage(path: result).then((value) {
                ref
                    .read(imageStateProvider.state)
                    .update((state) => ImageState.notuploaded());
                ref.read(imageUrl.state).update((state) => value);
              });
              ref.read(webfileProvier.state).update((state) => webImage);
            }
          }
          final imageSource = await ImageSourcePicker.showImageSource(context);
          if (imageSource != null) {
            final result = await ImageSourcePicker.pickFile(imageSource);
            if (result != null) {
              file = result;
              ref.read(itemProvider).addImage(path: result).then((value) {
                ref
                    .read(imageStateProvider.state)
                    .update((state) => ImageState.notuploaded());
                ref.read(imageUrl.state).update((state) => value);
              });
              ref.read(fileProvier.state).update((state) => result);
            }
          }
        },
        child: webfileUrl != null
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: kIsWeb ? size.convert(context, 110) : null,
                    child: kIsWeb
                        ? Image.memory(webfileUrl)
                        : Image.file(
                            fileurl!,
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                  ),
                  if (itemState is UPLOADING)
                    Container(
                      margin: EdgeInsets.all(50),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Center(child: CircularProgressIndicator()),
                          Text(
                            'uploading....',
                          ),
                        ],
                      ),
                    ),
                ],
              )
            : Image.asset(
                'assets/dumy.jpg',
                fit: BoxFit.cover,
                width: 100,
              ),
      ),
    );
  }
}

class _AddItemDetailFields extends HookConsumerWidget {
  final TextEditingController? nameController;
  final TextEditingController? purchaseController;
  final TextEditingController? warrantytimeController;
  final TextEditingController? claimTimeController;
  const _AddItemDetailFields(
      {required this.nameController,
      required this.purchaseController,
      this.warrantytimeController,
      this.claimTimeController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownvalue = ref.read(dropdownvalueProvider);
    var _Storenames = ["Komplett.no", "Elkjop.no", "Power.no"];
    Future<DateTime?> _showDatePicker(ctx) async {
      return showCupertinoModalPopup(
        context: ctx,
        builder: (_) => CupertinoActionSheet(
          actions: [
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                  backgroundColor: Constants.whiteColor,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (val) {
                    ref.read(dateProvier.state).update((state) => val);
                  }),
            ),
          ],
          cancelButton: CupertinoButton(
            color: Constants.whiteColor,
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(ref.read(dateProvier)),
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        CustomTextField(
            controller: nameController,
            showErrorBorder: true,
            floatingText: 'Name',
            inputStyle: TextStyle(color: Constants.grey),
            showCursor: true,
            keyboardType: TextInputType.name,
            hintStyle: TextStyle(color: Constants.grey),
            textInputAction: TextInputAction.next,
            validator: FormValidator.nameValidator),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
            controller: purchaseController,
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              final date = await _showDatePicker(context);
              if (date != null) {
                purchaseController!.text =
                    ImageSourcePicker.formatDate(date.toString());
              }
            },
            showErrorBorder: true,
            floatingText: 'Purchase Date',
            inputStyle: TextStyle(color: Constants.grey),
            showCursor: true,
            keyboardType: TextInputType.name,
            hintStyle: TextStyle(color: Constants.grey),
            textInputAction: TextInputAction.next,
            validator: FormValidator.datevalidator),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              'Purchase Store',
              style: context.bodyText1.copyWith(color: Constants.grey),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              dropdownColor: Constants.whiteColor,
              value: dropdownvalue,
              items: _Storenames.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      e,
                      style: context.bodyText1.copyWith(color: Constants.grey),
                    ),
                  ),
                ),
              ).toList(),
              onChanged: (value) {
                ref
                    .read(dropdownvalueProvider.state)
                    .update((state) => value.toString());
              },
            ),
          ),
        ),
        SizedBox(
            height: 2.0,
            child: Divider(
              color: Constants.black,
              thickness: 0.4,
            )),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
            controller: warrantytimeController,
            showErrorBorder: true,
            floatingText: 'Warranty Time',
            inputStyle: TextStyle(color: Constants.grey),
            showCursor: true,
            keyboardType: TextInputType.number,
            hintStyle: TextStyle(color: Constants.grey),
            textInputAction: TextInputAction.next,
            validator: FormValidator.timevalidator),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
            controller: claimTimeController,
            showErrorBorder: true,
            floatingText: 'Claim Time',
            inputStyle: TextStyle(color: Constants.grey),
            showCursor: true,
            keyboardType: TextInputType.number,
            hintStyle: TextStyle(color: Constants.grey),
            textInputAction: TextInputAction.next,
            validator: FormValidator.clainvalidator),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
