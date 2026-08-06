import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/widgets/chat_tile/chat_tile.dart';
import 'package:home/presentation/nested_contacts_screen/bloc/nested_contacts_bloc.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:shared_ui/core_ui.dart';

class NestedContactsContent extends StatelessWidget {
  const NestedContactsContent({
    super.key,
    required this.anchorDisplayName,
    required this.isFriendsOfRelative,
    required this.isLoading,
    required this.contacts,
    required this.loadError,
  });

  final String anchorDisplayName;
  final bool isFriendsOfRelative;
  final bool isLoading;
  final List<Interlocutor> contacts;
  final AppErrorViewModel? loadError;

  @override
  Widget build(BuildContext context) {
    final NestedContactsBloc bloc = context.read<NestedContactsBloc>();
    final AppNavigator navigator = appLocator<AppNavigator>();
    final AppLocalizations texts = context.texts;
    final String title = isFriendsOfRelative
        ? texts.nestedFriendsTitle(anchorDisplayName)
        : texts.nestedRelativesTitle(anchorDisplayName);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: AppBackButton(onPressed: navigator.navigateBack),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Values.dividerThickness),
          child: Divider(
            height: Values.dividerThickness,
            thickness: Values.dividerThickness,
            color: context.colors.border.main,
          ),
        ),
      ),
      body: isLoading && contacts.isEmpty
          ? const Center(child: AppPendingIndicator())
          : contacts.isEmpty
          ? _NestedContactsEmptyBody(
              loadError: loadError,
              onRetryTapped: () => bloc.add(const NestedContactsEvent.retryRequested()),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final Interlocutor contact = contacts[index];
                return ChatTile(
                  interlocutor: contact,
                  showTopBorder: index > 0,
                  onTapped: () => navigator.navigateChat(
                    interlocutorId: contact.userId,
                    displayName: contact.displayName,
                  ),
                );
              },
            ),
    );
  }
}

final class _NestedContactsEmptyBody extends StatelessWidget {
  const _NestedContactsEmptyBody({required this.loadError, required this.onRetryTapped});

  final AppErrorViewModel? loadError;
  final VoidCallback onRetryTapped;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations texts = context.texts;

    if (loadError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                texts.homeLoadErrorMessage,
                textAlign: TextAlign.center,
                style: context.caption.copyWith(color: context.colors.text.secondary),
              ),
              const SizedBox(height: 16),
              AppAccentButton(title: texts.commonRetry, onTapped: onRetryTapped),
            ],
          ),
        ),
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
        child: Text(
          texts.nestedEmptyMessage,
          textAlign: TextAlign.center,
          style: context.caption.copyWith(color: context.colors.text.secondary),
        ),
      ),
    );
  }
}
