import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'basic_overlay.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    // Key key,
    required this.controller,
  });
  // : super(key: key);

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? Container(alignment: Alignment.topCenter, child: buildVideo())
      : const SizedBox(
          height: 200,
          width: double.infinity,
          child: Center(child: CircularProgressIndicator()),
        );

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(child: BasicOverlayWidget(controller: controller)),
        ],
      );

  Widget buildVideoPlayer() => SizedBox(
        width: double.infinity,
        // aspectRatio: controller.value.aspectRatio * 3,
        child: VideoPlayer(controller),
      );
}
