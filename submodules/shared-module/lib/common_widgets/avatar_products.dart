import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/common_widgets/product_detail_video.dart';
import '../utils/image_error_builder.dart';

class AvatarProductCommon extends StatelessWidget {
  final String urlImage;
  final bool? isVideo;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final bool? autoPlayVideo;
  final Widget? errorBuilderWidget;

  const AvatarProductCommon(
      {super.key,
      required this.urlImage,
      this.isVideo = false,
      this.borderRadius,
      this.height,
      this.width,
      this.autoPlayVideo = false,
      this.errorBuilderWidget = const ImageError()});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      decoration:
          BoxDecoration(borderRadius: borderRadius ?? BorderRadius.circular(0)),
      clipBehavior: Clip.hardEdge,
      child: isVideo == true
          ? loadVideo(autoPlayVideo, borderRadius, urlImage)
          : loadImage(urlImage, errorBuilderWidget,
              width: width, height: height),
    );
  }
}

Widget loadImage(url, errorBuilderWidget, {double? height, double? width}) =>
    CachedNetworkImage(
      errorWidget: (context, url, error) =>
          _imageErrorBuilder(context, url, error, url, errorBuilderWidget),
      imageUrl: url,
      fit: BoxFit.cover,
      height: height ?? double.infinity,
      width: width ?? double.infinity,
    );

class LoadImageError extends StatefulWidget {
  const LoadImageError(
      {super.key, required this.url, required this.errorBuilderWidget});

  final String url;
  final Widget errorBuilderWidget;

  @override
  State<LoadImageError> createState() => _ImageErrorState();
}

class _ImageErrorState extends State<LoadImageError> {
  bool reConnect = false;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        reConnect = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return reConnect
        ? CachedNetworkImage(
            errorWidget: (context, url, error) => widget.errorBuilderWidget,
            imageUrl: widget.url,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          )
        : Container(
            padding: const EdgeInsets.all(16),
            child: const CircularProgressIndicator());
  }
}

Widget _imageErrorBuilder(
        context, error, stackTrace, url, errorBuilderWidget) =>
    LoadImageError(
      url: url, errorBuilderWidget: errorBuilderWidget,
    );

Widget loadVideo(autoPlay, borderRadius, url) => ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: VideoApp(
        urlVideo: url,
        autoPlay: autoPlay,
      ),
    );
