import 'dart:async';

import 'package:chat/presentation/chat_screen/widgets/typing_view/bloc/typing_view_bloc.dart';
import 'package:chat/presentation/chat_screen/widgets/typing_view/widgets/attach_file_button.dart';
import 'package:chat/presentation/chat_screen/widgets/typing_view/widgets/send_message_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

/// ОБЛАСТЬ ВВОДА СООБЩЕНИЙ
class TypingView extends StatefulWidget {
  const TypingView({required this.interlocutorId, super.key});

  final String interlocutorId;

  @override
  State<TypingView> createState() => _TypingViewState();
}

class _TypingViewState extends State<TypingView> {
  late final TextEditingController _messageController;
  late final FocusNode _composerFocusNode;
  final GlobalKey _fieldKey = GlobalKey();

  /// Square side for attach/send — locked to the field's single-line height.
  double _sideButtonSize = Values.buttonHeight;
  bool _hasMeasuredSingleLineHeight = false;

  @override
  void initState() {
    super.initState();
    _composerFocusNode = FocusNode(debugLabel: 'ChatComposer');
    _messageController = TextEditingController()..addListener(_onComposerTextChanged);
  }

  @override
  void dispose() {
    _messageController
      ..removeListener(_onComposerTextChanged)
      ..dispose();
    _composerFocusNode.dispose();
    super.dispose();
  }

  void _onComposerTextChanged() {
    if (_messageController.text.isEmpty) {
      // Remeasure after clear / text-scale changes when back to one line.
      _hasMeasuredSingleLineHeight = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureSingleLineFieldHeight());
    }
  }

  void _measureSingleLineFieldHeight() {
    if (!mounted || _messageController.text.isNotEmpty) return;

    final RenderObject? renderObject = _fieldKey.currentContext?.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;

    final double height = renderObject.size.height;
    if (_hasMeasuredSingleLineHeight && (height - _sideButtonSize).abs() < 0.5) return;

    setState(() {
      _sideButtonSize = height;
      _hasMeasuredSingleLineHeight = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasMeasuredSingleLineHeight && _messageController.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureSingleLineFieldHeight());
    }

    return BlocProvider<TypingViewBloc>(
      create: (BuildContext context) => appLocator<TypingViewBloc>(param1: widget.interlocutorId),
      // Builder (not BlocBuilder): need a descendant context for read(), without rebuilds on isSending.
      child: Builder(
        builder: (BuildContext context) => DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.colors.border.main)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
            // Keeps send/attach inside the EditableText tap region so IME stays open.
            child: TextFieldTapRegion(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  AttachFileButton(
                    size: _sideButtonSize,
                    onTapped: () => unawaited(_onAttachTapped(context)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: KeyedSubtree(
                      key: _fieldKey,
                      child: CommonEditField(
                        controller: _messageController,
                        focusNode: _composerFocusNode,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (String val) => _onMessageChanged(context, val),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SendMessageButton(size: _sideButtonSize, onTapped: () => _onSendTapped(context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onMessageChanged(BuildContext context, String val) {
    context.read<TypingViewBloc>().add(TypingViewEvent.onMessageChanged(val));
  }

  void _onSendTapped(BuildContext context) {
    final String text = _messageController.text;
    if (text.trim().isEmpty) return;

    // Clear immediately without touching focus — keyboard must stay open.
    _messageController.clear();
    context.read<TypingViewBloc>().add(TypingViewEvent.onSendTapped(text: text));
  }

  Future<void> _onAttachTapped(BuildContext context) async {
    final AppLocalizations localization = context.texts;
    final AppMediaFile? mediaFile = await AppMediaFilePicker.singleImage(
      context,
      labels: AppMediaFilePickerLabels(
        accessDeniedNote: localization.chatPickerAccessDeniedNote,
        openAppSettings: localization.chatPickerOpenSettings,
        emptyAlbumsNote: localization.chatPickerEmptyAlbumsNote,
        allowCameraInSettingsNote: localization.chatPickerAllowCameraNote,
        cameraCaptureHint: localization.chatPickerCameraHint,
        done: localization.chatPickerDone,
        selectedCountPrefix: localization.chatPickerSelectedPrefix,
        back: localization.chatPickerBack,
        ok: localization.commonOk,
      ),
    );

    if (!context.mounted || mediaFile?.file == null) return;

    context.read<TypingViewBloc>().add(
      TypingViewEvent.onImagePicked(filePath: mediaFile!.file!.path),
    );
  }
}
