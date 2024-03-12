import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_module/utils/image_utils.dart';
import 'package:shared_module/utils/regex_utils.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.avatarId,
    required this.size,
    this.frame,
    this.margin,
    this.hasCrownMark = true,
  });

  final Size size;
  final String avatarId;
  final String? frame;
  final EdgeInsetsGeometry? margin;
  final bool hasCrownMark;
  static const defaultAvatarAsset = 'packages/social_plugin/assets/defaultUser.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.width,
      margin: margin,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          //* circle mark
          if (hasCrownMark)
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.red],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              margin: EdgeInsets.all(size.width * 0.025),
            ),
          //* avatar
          Container(
            // margin: EdgeInsets.all(size.width * 0.04),
            margin: EdgeInsets.all(
                hasCrownMark ? size.width * 0.05 : size.width * 0.025),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: size.width * 0.025,
                // strokeAlign:
              ),
            ),
            child: CircleAvatar(
              backgroundImage:
                  avatarId.isNotEmpty == true && !RegexUtils.isDefaultAvatar(avatarId)
                      ? CachedNetworkImageProvider(getImageById(avatarId, ImageType.mobile))
                      : const AssetImage(defaultAvatarAsset) as ImageProvider,
              foregroundImage:
                  frame?.isNotEmpty == true ? CachedNetworkImageProvider(frame!) : null,
            ),
          ),
          //* Crown mark
          if (hasCrownMark)
            Positioned(
              right: size.width * 0.5 * 0.41 / 1.41 - size.width * 0.12,
              top: size.width * 0.5 * 0.41 / 1.41 - size.width * 0.12,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                width: size.width * 0.24,
                height: size.width * 0.24,
                padding: EdgeInsets.all(size.width * 0.025),
                child: SvgPicture.asset(
                    'packages/social_plugin/assets/icons/crown.svg'),
              ),
            ),
        ],
      ),
    );
  }
}
