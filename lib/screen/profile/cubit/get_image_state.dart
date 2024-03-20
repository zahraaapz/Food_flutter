part of 'get_image_cubit.dart';

@immutable
sealed class GetImageState {}

final class GetImageSuccess extends GetImageState {
  final image;
  GetImageSuccess(this.image);
}
final class GetImageNotSuccess extends GetImageState {}
final class GetImageEmpty extends GetImageState {}
