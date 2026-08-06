import 'package:flutter/material.dart';
import 'package:home/presentation/nested_contacts_screen/bloc/nested_contacts_bloc.dart';
import 'package:home/presentation/nested_contacts_screen/nested_contacts_args.dart';
import 'package:home/presentation/nested_contacts_screen/nested_contacts_content.dart';
import 'package:shared_core/core.dart';

@RoutePage()
class NestedContactsScreen extends StatelessWidget {
  const NestedContactsScreen({
    super.key,
    required this.anchorUserId,
    required this.anchorDisplayName,
    required this.isFriendsOfRelative,
  });

  final String anchorUserId;
  final String anchorDisplayName;
  final bool isFriendsOfRelative;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NestedContactsBloc>(
      create: (_) => appLocator<NestedContactsBloc>(
        param1: NestedContactsArgs(
          anchorUserId: anchorUserId,
          anchorDisplayName: anchorDisplayName,
          isFriendsOfRelative: isFriendsOfRelative,
        ),
      ),
      child: BlocBuilder<NestedContactsBloc, NestedContactsState>(
        builder: (BuildContext context, NestedContactsState state) => NestedContactsContent(
          anchorDisplayName: state.anchorDisplayName,
          isFriendsOfRelative: state.isFriendsOfRelative,
          isLoading: state.isLoading,
          contacts: state.contacts,
          loadError: state.loadError,
        ),
      ),
    );
  }
}
