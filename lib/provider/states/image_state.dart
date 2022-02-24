import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.notuploaded() = NOTUPLOADED;
  const factory ImageState.uploading() = UPLOADING;
  const factory ImageState.uploaded() = UPLOADED;
  const factory ImageState.failed({required String reason}) = FAILED;
}
