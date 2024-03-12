import 'package:shared_module/features/share_to_feed/model/DescriptionShareToFeedModel.dart';
import 'package:shared_module/features/share_to_feed/view/share_to_feed_page.dart';

class ShareToFeedModel {
  final DagObjectName dagObjectName;
  final ShareLinkType shareLinkType;
  final String dagObjectId;
  final DescriptionShareToFeedModel descriptionShareToFeedModel;

  ShareToFeedModel(
      {required this.dagObjectName,
      required this.shareLinkType,
      required this.dagObjectId,
      required this.descriptionShareToFeedModel,});
}
