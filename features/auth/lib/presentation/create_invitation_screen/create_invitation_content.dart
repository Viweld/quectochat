import 'package:auth/domain/entities/created_invitation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class CreateInvitationContent extends StatelessWidget {
  const CreateInvitationContent({super.key, required this.isLoading, required this.invitation});

  final bool isLoading;
  final CreatedInvitation? invitation;

  static const double _qrSize = 220;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations texts = context.texts;
    final CreatedInvitation? invitation = this.invitation;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: AppFloatingBackButton(
        onPressed: () => appLocator<AppNavigator>().navigateBack(),
      ),
      body: SafeArea(
        child: isLoading && invitation == null
            ? const Center(child: AppPendingIndicator())
            : invitation == null
            ? const SizedBox.shrink()
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 60),
                    Text(
                      texts.inviteShareTitle,
                      style: context.mainTitle.copyWith(color: context.colors.text.main),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      texts.inviteShareSubtitle,
                      textAlign: TextAlign.center,
                      style: context.message.copyWith(color: context.colors.text.main),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      invitation.formattedCode,
                      style: context.mainTitle.copyWith(color: context.colors.text.main),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      texts.inviteShareCopyHint,
                      textAlign: TextAlign.center,
                      style: context.caption.copyWith(color: context.colors.text.secondary),
                    ),
                    const SizedBox(height: 24),
                    QrImageView(
                      data: invitation.code,
                      size: _qrSize,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      texts.inviteShareExpiresLabel(
                        DateFormat.yMMMd(
                          Localizations.localeOf(context).toString(),
                        ).add_Hm().format(invitation.expiresAt.toLocal()),
                      ),
                      textAlign: TextAlign.center,
                      style: context.message.copyWith(color: context.colors.text.main),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
