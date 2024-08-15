import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/theme/app_colors.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';
import 'package:video_player/video_player.dart';

@RoutePage()
class VideoFullscreenPage extends StatefulWidget {
  const VideoFullscreenPage({required this.videoPlayerController, super.key});

  static const String routeName = '/video-fullscreen';

  final VideoPlayerController videoPlayerController;

  @override
  State<VideoFullscreenPage> createState() => _VideoFullscreenPageState();
}

class _VideoFullscreenPageState extends State<VideoFullscreenPage> {
  @override
  void initState() {
    widget.videoPlayerController.addListener(closeVideo);
    widget.videoPlayerController.play();
    if (kDebugMode) {
      widget.videoPlayerController.seekTo(
          widget.videoPlayerController.value.duration -
              const Duration(seconds: 3));
    }
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    widget.videoPlayerController.pause();
    widget.videoPlayerController.removeListener(closeVideo);
    super.dispose();
  }

  void closeVideo() async {
    if (widget.videoPlayerController.value.isCompleted) {
      if (getIt<AppRouter>().current.name == VideoFullscreenRoute.name) {
        getIt<AppRouter>().back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Hero(
              tag: 'video',
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(widget.videoPlayerController),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withOpacity(0)
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            widget.videoPlayerController.seekTo(
                                widget.videoPlayerController.value.position -
                                    const Duration(seconds: 10));
                          },
                          icon: const Icon(
                            Icons.replay_10_rounded,
                            color: AppColors.bodyOnPrimary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (widget.videoPlayerController.value.isPlaying) {
                              widget.videoPlayerController.pause();
                            } else {
                              widget.videoPlayerController.play();
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            widget.videoPlayerController.value.isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_circle_outline_rounded,
                            color: AppColors.bodyOnPrimary,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
