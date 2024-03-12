import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shared_module/constants/color_palette.dart';
import 'package:shared_module/shared_module.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoApp extends StatefulWidget {
  final String urlVideo;
  final bool autoPlay;
  const VideoApp({super.key, required this.urlVideo, this.autoPlay = true});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  @override
  Widget build(BuildContext context) {
    return widget.urlVideo
            .startsWith(SharedModule.appDelegates!.config.apiBaseUrl)
        ? VideoServer(
            urlVideo: widget.urlVideo,
            autoPlay: widget.autoPlay,
          )
        : VideoYtb(
            urlVideo: widget.urlVideo,
            autoPlay: widget.autoPlay,
          );
  }
}

class VideoYtb extends StatefulWidget {
  final String urlVideo;
  final bool autoPlay;
  const VideoYtb({super.key, required this.urlVideo, this.autoPlay = true});

  @override
  State<VideoYtb> createState() => _VideoYtbState();
}

class _VideoYtbState extends State<VideoYtb> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    String videoId = extractVideoIdFromUrl(widget.urlVideo);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        hideControls: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String extractVideoIdFromUrl(String url) {
    Uri uri = Uri.parse(url);

    if ((uri.host == "www.youtube.com" || uri.host == "m.youtube.com") &&
        uri.queryParameters.containsKey("v")) {
      return uri.queryParameters["v"] ?? "";
    }

    if (uri.host == "www.youtube.com" && uri.pathSegments.contains("embed")) {
      int index = uri.pathSegments.indexOf("embed");
      if (index < uri.pathSegments.length - 1) {
        return uri.pathSegments[index + 1];
      }
    }
    if (uri.host == "youtu.be") {
      return uri.pathSegments.first;
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: ColorPalette.baseWhite,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
              _controller.addListener(() {});
            },
          ),
          builder: (context, player) => player,
        ),
      ),
    ));
  }
}

class VideoServer extends StatefulWidget {
  final String urlVideo;
  final bool autoPlay;
  const VideoServer({super.key, required this.urlVideo, this.autoPlay = true});

  @override
  State<VideoServer> createState() => _VideoServerState();
}

class _VideoServerState extends State<VideoServer> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture();
  }

  _initializeVideoPlayerFuture() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.urlVideo));
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: widget.autoPlay,
      looping: true,
      autoInitialize: true,
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
      ),
      hideControlsTimer: const Duration(seconds: 1),
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    chewieController?.videoPlayerController.pause();
    chewieController?.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: (chewieController != null)
            ? AspectRatio(
                aspectRatio: 1,
                child: Chewie(
                  controller: chewieController!,
                ),
              )
            : const CircularProgressIndicator());
  }
}
