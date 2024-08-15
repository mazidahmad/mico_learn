import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/extensions/time_extension.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/contents/video_content.dart';

class VideoContentWidget extends StatefulWidget {
  const VideoContentWidget(
      {required this.content, required this.onVideoComplete, super.key});

  final VideoContent content;
  final void Function() onVideoComplete;

  @override
  State<VideoContentWidget> createState() => _VideoContentWidgetState();
}

class _VideoContentWidgetState extends State<VideoContentWidget> {
  late final VideoPlayerController controller;
  int _videoDuration = 0;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.content.videoUrl));
    await controller.initialize();
    controller.addListener(listener);
  }

  void listener() {
    if (getIt<AppRouter>().current.name == LearningDetailRoute.name) {
      setState(
        () {
          if (_videoDuration == 0) {
            _videoDuration = controller.value.duration.inSeconds;
          }
        },
      );
    }
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.pause();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: GestureDetector(
          onTap: () async {
            if (controller.value.isPlaying) {
              await controller.pause();
              setState(() {});
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: screenSize.height - (300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primary),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://potatopirates.game/cdn/shop/articles/computational_thinking.jpg?v=1668646034',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: 1,
                    child: GestureDetector(
                      child: Hero(
                        tag: 'video',
                        child: SizedBox(
                          height: screenSize.height - (300),
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    colors: [
                                      AppColors.background.withOpacity(0),
                                      AppColors.primary
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gelang Warna Warni',
                                      style: AppTextStyle.headlineMedium(
                                          color: AppColors.bodyOnPrimary),
                                    ),
                                    const Gap(7),
                                    Container(
                                      height: 7,
                                      width: 77,
                                      decoration: BoxDecoration(
                                        color: AppColors.background,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const Gap(16),
                                    Row(
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.solidClock,
                                          size: 15,
                                          color: AppColors.background,
                                        ),
                                        const Gap(7),
                                        Text(
                                          controller.value.duration
                                              .toMinutesSeconds(),
                                          style: AppTextStyle.labelMedium(
                                              color: AppColors.bodyOnPrimary),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: 1,
                    child: GestureDetector(
                      onTap: () async {
                        await getIt<AppRouter>().push(VideoFullscreenRoute(
                            videoPlayerController: controller));

                        widget.onVideoComplete.call();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Center(
                            child: FaIcon(
                          FontAwesomeIcons.play,
                          color: AppColors.bodyOnPrimary,
                        )),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
