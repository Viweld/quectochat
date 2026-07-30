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
  final GlobalKey _fieldKey = GlobalKey();

  /// Square side for attach/send — locked to the field's single-line height.
  double _sideButtonSize = Values.buttonHeight;
  bool _hasMeasuredSingleLineHeight = false;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController()..addListener(_onComposerTextChanged);
  }

  @override
  void dispose() {
    _messageController
      ..removeListener(_onComposerTextChanged)
      ..dispose();
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
      child: BlocConsumer<TypingViewBloc, TypingViewState>(
        listenWhen: (TypingViewState previous, TypingViewState current) =>
            previous.typedMessage.isNotEmpty && current.typedMessage.isEmpty,
        listener: (BuildContext context, TypingViewState state) {
          if (_messageController.text.isNotEmpty) {
            _messageController.clear();
          }
        },
        builder: (BuildContext context, TypingViewState state) => DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.palette.stroke)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12,8,12,20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                AttachFileButton(size: _sideButtonSize, onTapped: () => _onAttachTapped(context)),
                const SizedBox(width: 8),
                Expanded(
                  child: KeyedSubtree(
                    key: _fieldKey,
                    child: CommonEditField(
                      controller: _messageController,
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
    );
  }

  void _onMessageChanged(BuildContext context, String val) {
    context.read<TypingViewBloc>().add(TypingViewEvent.onMessageChanged(val));
  }

  void _onSendTapped(BuildContext context) {
    context.read<TypingViewBloc>().add(const TypingViewEvent.onSendTapped());
  }

  void _onAttachTapped(BuildContext context) {
    // TODO(Vadim): #unimplemented
  }
}
