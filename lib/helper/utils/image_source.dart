import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ImageSourcePicker {
  static Future<File?> pickFile(ImageSource imageSource) async {
    ImagePicker _picker = ImagePicker();
    final XFile? image =
        await _picker.pickImage(source: imageSource, imageQuality: 50);
    if (image == null) return null;

    return File(image.path);
  }

  static String formatDate(String? date) {
    try {
      if (date == null) return '--';
      final dateTime = DateTime.parse(date).toLocal();

      return DateFormat('dd-MM-yy hh:mm a').format(dateTime);
    } catch (e) {
      return '--';
    }
  }

  static Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (_) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
              child: Text("Camera"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.of(context).pop(ImageSource.gallery);
              },
              child: Text("Gallery"),
            )
          ],
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text("Gallery"),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        ),
      );
    }
  }
}
