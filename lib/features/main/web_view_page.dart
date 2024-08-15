import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key});

  static const String routeName = '/web-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kuesioner',
          style: AppTextStyle.headlineExtraSmall(),
        ),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse('https://forms.office.com/r/gPTbnMGxRb'),
          ),
      ),
    );
  }
}
