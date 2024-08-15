import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/core/utils/app_asset_util.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/rive_content.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/text_content.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/text_header_content.dart';
import 'package:rive/rive.dart';

import '../../domain/entities/contents/slide_content.dart';

class SlideContentWidget extends StatefulWidget {
  const SlideContentWidget(
      {super.key, required this.slideContent, required this.onDone});

  final SlideContent slideContent;
  final void Function() onDone;

  @override
  State<SlideContentWidget> createState() => _SlideContentWidgetState();
}

class _SlideContentWidgetState extends State<SlideContentWidget> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => widget.onDone.call());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.slideContent.datas.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                var content = widget.slideContent.datas[index];
                if (content is RiveContent) {
                  return RiveContentWidget(content: content);
                }
                if (content is TextHeaderContent) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        (content).title,
                        style: AppTextStyle.headlineExtraSmall(),
                      ),
                    ),
                  );
                }
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      (content as TextContent).text,
                      style: AppTextStyle.bodyMedium(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class RiveContentWidget extends StatefulWidget {
  const RiveContentWidget({
    super.key,
    required this.content,
  });

  final RiveContent content;

  @override
  State<RiveContentWidget> createState() => _RiveContentWidgetState();
}

class _RiveContentWidgetState extends State<RiveContentWidget> {
  bool isSimulation = false;

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMITrigger? _hoverInput;
  SMITrigger? _pressInput;

  late RiveFile rive;

  bool isLoading = true;

  @override
  void initState() {
    isSimulation = widget.content.artboard == "simulasi-menyulam" ||
        widget.content.artboard == "simulasi-menyulam-2";
    if (isSimulation) {
      rootBundle
          .load(AppAssetUtil.getRiveAsset(widget.content.url))
          .then((data) {
        rive = RiveFile.import(data);
        var artboard = rive.artboardByName(widget.content.artboard)!;

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        _controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        if (_controller != null) {
          artboard.addController(_controller!);
          if (widget.content.artboard == "simulasi-menyulam") {
            _hoverInput = _controller?.getTriggerInput('A2 Click');
            _pressInput = _controller?.getTriggerInput('A4 Click');
          } else {
            _hoverInput = _controller?.getTriggerInput('E3 Click');
            _pressInput = _controller?.getTriggerInput('B3 Click');
          }
        }

        setState(() {
          _riveArtboard = artboard;
          isLoading = false;
        });
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_hoverInput?.value == false) {
          _hoverInput?.change(true);
        }

        if (_pressInput?.value == false) {
          _pressInput?.change(true);
        }
      },
      child: Container(
        height: widget.content.height.toDouble(),
        width: widget.content.width.toDouble(),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: !isSimulation
            ? RiveAnimation.asset(
                AppAssetUtil.getRiveAsset(widget.content.url),
                artboard: widget.content.artboard,
                placeHolder: const AppLoading(),
              )
            : isLoading
                ? const AppLoading()
                : Rive(
                    artboard: _riveArtboard!,
                  ),
      ),
    );
  }
}
