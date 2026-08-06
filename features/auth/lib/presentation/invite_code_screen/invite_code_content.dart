import 'package:auth/presentation/invite_code_screen/bloc/invite_code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class InviteCodeContent extends StatefulWidget {
  const InviteCodeContent({
    super.key,
    required this.code,
    required this.isLoading,
    required this.inlineError,
  });

  final String code;
  final bool isLoading;
  final AppErrorViewModel? inlineError;

  @override
  State<InviteCodeContent> createState() => _InviteCodeContentState();
}

class _InviteCodeContentState extends State<InviteCodeContent> {
  late final TextEditingController _pinController;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController(text: widget.code);
  }

  @override
  void didUpdateWidget(covariant InviteCodeContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.code != _pinController.text) {
      _pinController.value = TextEditingValue(
        text: widget.code,
        selection: TextSelection.collapsed(offset: widget.code.length),
      );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final InviteCodeBloc bloc = context.read<InviteCodeBloc>();
    final AppLocalizations texts = context.texts;
    final bool isCodeComplete = widget.code.length == 8;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: CommonFloatingBackButton(
        onPressed: () => appLocator<AppNavigator>().navigateBack(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Image.asset(Images.logo, package: kPackageName),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(texts.inviteCodeTitle, style: context.mainTitle),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(
                texts.inviteCodeSubtitle,
                textAlign: TextAlign.center,
                style: context.message,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonPinField(
                length: 8,
                separatorAfterIndex: 3,
                controller: _pinController,
                onChanged: (String value) => bloc.add(InviteCodeEvent.codeChanged(value)),
                errorText: _resolveInlineError(texts, widget.inlineError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextButton(
                onPressed: widget.isLoading
                    ? null
                    : () => bloc.add(const InviteCodeEvent.scanQrRequested()),
                child: Text(texts.inviteCodeScanQrButtonLabel),
              ),
            ),
            CommonAccentButton(
              title: texts.inviteCodeNextButtonLabel,
              isPending: widget.isLoading,
              isEnabled: isCodeComplete && !widget.isLoading,
              onTapped: () => bloc.add(const InviteCodeEvent.submitRequested()),
            ),
          ],
        ),
      ),
    );
  }

  String? _resolveInlineError(AppLocalizations texts, AppErrorViewModel? error) {
    if (error == null) return null;
    return switch (error.kind) {
      AppErrorKind.inviteExpired => texts.inviteCodeExpired,
      AppErrorKind.inviteUsed => texts.inviteCodeUsed,
      AppErrorKind.inviteNotFound => texts.inviteCodeNotFound,
      AppErrorKind.invalidInvite => texts.inviteCodeInvalid,
      AppErrorKind.network => texts.toastNetworkError,
      AppErrorKind.server => texts.toastServerError,
      _ => texts.inviteCodeInvalid,
    };
  }
}
