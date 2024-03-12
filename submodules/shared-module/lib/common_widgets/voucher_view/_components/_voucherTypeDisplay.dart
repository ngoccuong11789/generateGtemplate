import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/utils/image_error_builder.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:soctrip_icons/soctrip_icons.dart' as icon;

class VoucherTypeDisplay extends StatelessWidget {
  const VoucherTypeDisplay({super.key, this.content, this.image});

  final String? content;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return (content != null && image != null)
        ? Row(
            children: [
              CachedNetworkImage(
                imageUrl: getImageUrl(image ??"",type: ImageType.thumbnail),
                width: 36.0,
                height: 36.0,
                errorWidget: imageErrorBuilder,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(content!)
            ],
          )
        : const icon.SoctripIcon(icon.Icons.minus,
           style: TextStyle(color: ColorPalette.gray300),
          );
  }
}
