import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

/// Empty-list placeholder when home directory failed to load.
class HomeLoadErrorView extends StatelessWidget {
  const HomeLoadErrorView({super.key, required this.error, required this.onRetryTapped});

  final AppErrorViewModel error;
  final VoidCallback onRetryTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _resolveMessage(context, error.kind),
            textAlign: TextAlign.center,
            style: context.caption,
          ),
          const SizedBox(height: 16),
          AppAccentButton(title: context.texts.commonRetry, onTapped: onRetryTapped),
        ],
      ),
    );
  }

  String _resolveMessage(BuildContext context, AppErrorKind kind) {
    return switch (kind) {
      AppErrorKind.network => context.texts.toastNetworkError,
      AppErrorKind.server => context.texts.toastServerError,
      _ => context.texts.homeLoadErrorMessage,
    };
  }
}
