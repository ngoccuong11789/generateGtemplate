import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_gate/const/strings.dart';
import 'package:payment_gate/payment_gate.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_module/utils/uri_extension.dart';
import 'package:shared_module/features/auth/auth_controller.dart';

// This value is not used. Just to by pass the error on the payment page.
const _fakeProfile =
    '{"avatar_thumbnail_url":"20231010T170111579652820_b788e562-2704-4fc6-85ed-a865c6a04c4a_1696932071848","frame_url":"","first_name":"Nhi","last_name":"Nguyen","full_name":"Nhi Nguyen","number_of_mutual_friend":0,"id":"b788e562-2704-4fc6-85ed-a865c6a04c4a"}';

class PaymentGateScreen extends StatefulWidget {
  final Map<String, String> parameters;
  const PaymentGateScreen({super.key, required this.parameters});
  @override
  State<PaymentGateScreen> createState() => _PaymentGateScreenState();
}

class _PaymentGateScreenState extends State<PaymentGateScreen> {

  final WebViewController webViewController = WebViewController();
  bool isLoading = true;
  Completer _loadCompleter = Completer();

  @override
  void initState() {
    super.initState();
    _startWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SafeArea(child: _buildContent()),
        ));
  }

  Widget _buildContent() {
    if (isLoading) {
      return Stack(
        children: [
          _buildWebView(),
          Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(color: Color(0xFF1570EF),),
          )
        ],
      );
    }
    return _buildWebView();
  }

  Widget _buildWebView() {
    return WebViewWidget(controller: webViewController);
  }

  String _jsString(String? value) {
    if (value == null) {
      return "null";
    }
    value = value.replaceAll("\"", "\\\"");
    value = value.replaceAll("\r", "\\\r");
    value = value.replaceAll("\n", "\\\n");
    return "\"$value\"";
  }

  void _listenForConsoleLog() {
    webViewController.runJavaScript(""
        "window.console.log = function() {"
        "  FlutterConsole.postMessage(JSON.stringify(arguments));"
        "}");
  }

  void _updateAuthToken(String? authToken) {
    webViewController.runJavaScript("window.postMessage({"
        "  'type': 'authorized',"
        "  'token': {"
        "    'accessToken': ${_jsString(authToken)},"
        "  },"
        "  'profile': ${_jsString(_fakeProfile)}"
        "});");
  }

  Future<void> _startWebView() async {
    _loadCompleter = Completer();
    final authToken =
        await AuthController.instance.tokensManager.loadAccessToken();
    final frontEndUrl =
        Uri.parse("${PaymentGateApp.config.paymentBaseUrl}order")
            .copyWith(queryParameters: widget.parameters);
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            _listenForConsoleLog();
            final currentUrl = Uri.parse(url);
            if (currentUrl == frontEndUrl) {
              _updateAuthToken(authToken);
              setState(() {
                isLoading = false;
              });
              _loadCompleter.complete();
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            final callback = _getCallback(request.url);
            if (request.isMainFrame && callback != null) {
              GoRouter.of(context)
                  .pop(_getCallbackParameters(request.url, callback.isSuccess));
              return NavigationDecision.prevent;
            }

            if (request.url.contains("/login")) {
              setState(() {
                isLoading = true;
              });
              _postReload();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel("FlutterConsole", onMessageReceived: (message) {
        // We can print the log for the debug purpose.
        // debugPrint("js-console.log: ${message.message}");
      })
      ..loadRequest(frontEndUrl);
  }

  _CallbackModel? _getCallback(String url) {
    if (url.startsWith(PaymentGateApp.successCallbackUrl)){
      return _CallbackModel(true);
    }
    if(url.startsWith(PaymentGateApp.failCallbackUrl)) {
      return _CallbackModel(false);
    }
    return null;
  }

  Map<String, String>? _getCallbackParameters(String url, bool isSuccess) {
    final uri = Uri.parse(url);
    return {
      ...uri.queryParameters,
      Strings.keyIsCallbackSuccess: isSuccess.toString()
    };
  }

  Future<void> _postReload() async {
    await _loadCompleter.future;
    await Future.delayed(const Duration(
        milliseconds: 2000)); // Hot fix, wait for window.postMessage to work
    _loadCompleter = Completer();
    webViewController.reload();
  }
}

class _CallbackModel {
  final bool isSuccess;

  _CallbackModel(this.isSuccess);
}