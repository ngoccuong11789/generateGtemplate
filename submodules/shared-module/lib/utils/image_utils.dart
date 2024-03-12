import 'package:shared_module/shared_module.dart';

class ImageType<T> {
  final String name;

  const ImageType._(this.name);

  static const ImageType<String> thumbnail = ImageType._("thumbnail");
  static const ImageType<String> web = ImageType._("web");
  @Deprecated("Back-end team has announced that they will no longer support mobile image type. Now we should move to web instead")
  static const ImageType<String> mobile = ImageType._("web");
  static const ImageType<ImageSet> all = ImageType._("all");
}

class ImageSet {
  final String thumbnail;
  final String web;
  @Deprecated("Back-end team has announced that they will no longer support mobile image type. Now we should move to web instead")
  final String mobile;

  ImageSet._({required this.thumbnail, required this.web, required this.mobile});
}

String get _root =>
    SharedModule.appDelegates?.config.apiBaseUrl ??
    "https://api-dev-soctrip.tma-swerp.com/";

const _defaultExt = ".webp";

T getImageById<T extends Object>(String id, ImageType<T> type,
    {String extension = _defaultExt}) {
  if (type == ImageType.all) {
    return ImageSet._(
        thumbnail: getImageById(id, ImageType.thumbnail),
        web: getImageById(id, ImageType.web),
        mobile: getImageById(id, ImageType.mobile)) as T;
  } else {
    String result =
        getImageUrl(id, type: type as ImageType<String>, extension: extension);
    return result as T;
  }
}

bool _isValidURL(String? url) {
  if (url == null) return false;
  return RegExp(r'^https?://', caseSensitive: false).hasMatch(url);
}

/// Get the image URL from and input parameter [idOrUrl]
/// Return null if [idOrUrl] is null.
/// Return [idOrUrl] if [idOrUrl] is an URL.
/// Otherwise, return the URL to get the image from storage service
/// (Assume that [idOrUrl] is a valid image ID).
/// Image [type] can be [ImageType.web] or [ImageType.thumbnail].
/// The [extension] will be the extension which will be
/// appended to the generated URL.
StringType getImageUrl<StringType extends String?>(StringType idOrUrl,
    {ImageType<String> type = ImageType.web, String extension = _defaultExt}) {
  if (idOrUrl == null) {
    return idOrUrl;
  } else if (_isValidURL(idOrUrl)) {
    return idOrUrl;
  } else {
    return "${_root}storage/files/${type.name}/$idOrUrl$extension"
        as StringType;
  }
}

StringType getVideoThumbnailUrl<StringType extends String?>(StringType id,
    {String extension = _defaultExt}) {
  if (id == null) {
    return id;
  } else {
    return "${_root}storage-streaming/files/thumbnail/$id$extension"
        as StringType;
  }
}
