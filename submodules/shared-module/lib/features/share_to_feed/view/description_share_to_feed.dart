import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/features/share_to_feed/model/DescriptionShareToFeedModel.dart';
import 'package:flutter_html/flutter_html.dart';

class DescriptionShareToFeed extends StatefulWidget {
  final DescriptionShareToFeedModel? data;

  const DescriptionShareToFeed({super.key, this.data});

  @override
  State<DescriptionShareToFeed> createState() => _DescriptionShareToFeedState();
}

class _DescriptionShareToFeedState extends State<DescriptionShareToFeed> {

  infoItem(DescriptionShareToFeedModel data) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Text(
        data.title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color(0xFF101828),
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),),
      Text(
        data.subTitle ?? '',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color(0xFF667085),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );

  avatarCircle(DescriptionShareToFeedModel data) =>
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: 44,
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(data.avatarId ?? ''),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: infoItem(data))
            ],
          ),
      );

  description(DescriptionShareToFeedModel data) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Html(
                data: "<div class= 'description'>${data.description ?? ''}</div>" ,
                style: {
                  ".description": Style(
                    fontSize: FontSize(16),
                    color: const Color(0xFF344054),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 3
                  )
                },
              ),
            ),
          ],
        ),
      );

  imageItem(DescriptionShareToFeedModel data) => Container(
      width: double.infinity,
      height: 300,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          stops: [0.0, 1],
          colors: [
            Colors.white.withOpacity(1.0),
            Colors.white.withOpacity(0.0)
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: CachedNetworkImageProvider(data.imageItem ?? ''))),
      ));

  descriptionPost() => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          padding: const EdgeInsets.only(top: 12),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFF9FAFB),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFEAECF0)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              avatarCircle(widget.data!),
              description(widget.data!),
              imageItem(widget.data!)
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return descriptionPost();
  }
}
