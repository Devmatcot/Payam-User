// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../packages.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({this.url, this.title, super.key});
  String? url;
  String? title;

  @override
  State<WebViewScreen> createState() => _ChatScreenState();
}

String htmlContent = """<script>
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://support.bellmfb.com/app-assets/chat_js';
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'best-support-system-chat'));
</script>""";

class _ChatScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  double prgressValue = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..getTitle()
      ..canGoBack()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // print('Progress $progress');
            setState(() {
              prgressValue = progress / 100;
            });
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://google.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      // ..loadHtmlString(htmlContent)
      // ..loadRequest(Uri.dataFromString(htmlContent, mimeType: 'text/html'))
      //     .toString();
      ..loadRequest(Uri.parse(widget.url ??
          'https://support.enaira.gov.ng/index.php?p=link&sp=1&ssp=en'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<PageViewControllers>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.secondary,
        title: Text(
          widget.title ?? 'Chat',
          style: AppTextStyle.headline1,
        ),
      ),
      body: Column(
        children: [
          prgressValue != 1
              ? LinearProgressIndicator(
                  value: prgressValue,
                )
              : SizedBox(),
          Expanded(
            child: WebViewWidget(
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              controller: controller,
            ),
          ),
        ],
      ),

      //  Column(
      //   children: [

      //     Expanded(
      //       child: WebViewWidget(
      //         controller: controller,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
