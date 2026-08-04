import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';
import 'package:shared_ui/src/values/values.dart';

class CommonEditField extends StatefulWidget {
  const CommonEditField({
    this.controller,
    this.initialText,
    this.hintText,
    this.textCapitalization,
    this.keyboardType,
    this.readOnly = false,
    this.align = TextAlign.start,
    this.onTap,
    this.onClearTapped,
    this.onChanged,
    this.onUnfocused,
    this.focusNode,
    this.prefix,
    this.maxLength,
    this.validationErrorText,
    this.validationError = false,
    this.isEnabled = true,
    this.onTapOutside,
    this.unfocusOnTapOutside = true,
    this.inputFormatters,
    this.title,
    this.isPassword = false,
    this.customTextStyle,
    this.minLines = 1,
    this.maxLines = 1,
    super.key,
  });

  /// Подсказка для ввода текста в поле ввода.
  final String? hintText;

  /// Исходный текст, который будет отображаться в поле ввода при его инициализации.
  final String? initialText;

  /// Контроллер, связывающий поле ввода с текстом.
  final TextEditingController? controller;

  /// Стиль заглавных букв для вводимого текста.
  final TextCapitalization? textCapitalization;

  /// Тип клавиатуры, которая будет отображаться при вводе текста.
  final TextInputType? keyboardType;

  /// Выравнивание текста в поле ввода.
  final TextAlign align;

  /// Флаг, указывающий, можно ли редактировать текст в поле ввода.
  final bool readOnly;

  /// Обратный вызов, который будет вызываться при нажатии на поле ввода.
  final VoidCallback? onTap;

  /// Обратный вызов, который будет вызываться при нажатии на кнопку очистки.
  final VoidCallback? onClearTapped;

  /// Обратный вызов, который будет вызываться при прекращении ввода.
  final VoidCallback? onUnfocused;

  /// Обратный вызов, который будет вызываться при изменении текста в поле ввода (срабатывает при изменении каждого символа).
  final Function(String)? onChanged;

  /// Фокусный узел. Управляет фокусом поля ввода.
  final FocusNode? focusNode;

  /// Виджет, отображаемый после текста внутри поля ввода.
  final Widget? prefix;

  /// Максимальное количество символов, которое можно ввести в поле.
  final int? maxLength;

  /// Текст ошибки, который будет отображаться, если введенное значение недопустимо.
  final String? validationErrorText;

  /// When true, border and typed text are highlighted in red. Error text is omitted.
  final bool validationError;

  /// Флаг, указывающий, включено ли поле ввода для взаимодействия.
  final bool isEnabled;

  /// Обратный вызов, который будет вызываться при нажатии за пределами поля ввода.
  final Function(PointerDownEvent)? onTapOutside;

  /// When false, tapping outside does not dismiss focus/keyboard (chat composer).
  final bool unfocusOnTapOutside;

  /// Список форматировщиков для вводимого текста.
  final List<TextInputFormatter>? inputFormatters;

  /// Лейбл с названием поля
  final String? title;

  /// Флаг, указывающий, является ли данный виджет полем ввода пароля
  final bool isPassword;

  /// Принудительное указание стиля текста
  final TextStyle? customTextStyle;

  /// Minimum number of visible text lines. Use with [maxLines] for growing fields.
  final int minLines;

  /// Maximum number of visible text lines. Excess content scrolls inside the field.
  /// Keep `1` for the fixed-height single-line design used across auth/home.
  final int? maxLines;

  static const double borderThickness = 1;

  @override
  State<CommonEditField> createState() => _CommonEditFieldState();
}

class _CommonEditFieldState extends State<CommonEditField> {
  late TextEditingController _textController;
  late FocusNode _focusNode;
  late String? _errorText;
  late bool _error;
  late AppColorsTheme _colors;

  InputBorder get _regularBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
    borderSide: BorderSide(color: _colors.border.main),
  );

  InputBorder get _focusedBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
    borderSide: BorderSide(color: _colors.border.main),
  );

  InputBorder get _errorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
    borderSide: BorderSide(color: _colors.feedback.error),
  );

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode()
      ..addListener(_focusNodeListener);
    _textController = widget.controller ?? TextEditingController();
    _textController
      ..text = widget.initialText ?? ''
      ..addListener(_textControllerListener);
    _errorText = widget.validationErrorText;
    _error = widget.validationError;
  }

  @override
  void dispose() {
    _textController.removeListener(_textControllerListener);
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _colors = context.colors;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(CommonEditField oldWidget) {
    _colors = context.colors;

    setState(() {
      _errorText = widget.validationErrorText;
      _error = widget.validationError;
    });
    _updateInitialText(oldWidget, widget);
    super.didUpdateWidget(oldWidget);
  }

  void _updateInitialText(CommonEditField oldWidget, CommonEditField widget) {
    if (oldWidget.initialText != widget.initialText) {
      _textController
        ..text = widget.initialText ?? ''
        ..selection = TextSelection.collapsed(offset: _textController.text.length);
    }
  }

  void _textControllerListener() => setState(() {});

  void _focusNodeListener() {
    if (!_focusNode.hasFocus) widget.onUnfocused?.call();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMultiline = widget.minLines > 1 || (widget.maxLines ?? 1) != 1;
    final TextField textField = TextField(
      magnifierConfiguration: TextMagnifierConfiguration.disabled,
      onTapOutside: (PointerDownEvent event) {
        if (widget.unfocusOnTapOutside) {
          _focusNode.unfocus();
        }
        widget.onTapOutside?.call(event);
      },
      focusNode: _focusNode,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      textAlignVertical: isMultiline ? TextAlignVertical.top : TextAlignVertical.center,
      textAlign: widget.align,
      // в используемом шрифте символ \u2022 постоянно прыгает при вводе
      obscuringCharacter: '\u2055',
      obscureText: widget.isPassword,
      controller: _textController,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      onChanged: (String t) {
        widget.onChanged?.call(t);
        setState(() => _error = false);
      },
      enabled: widget.isEnabled,
      keyboardType: widget.isPassword
          ? TextInputType.text
          : (widget.keyboardType ?? (isMultiline ? TextInputType.multiline : null)),
      textInputAction: isMultiline ? TextInputAction.newline : TextInputAction.done,
      textCapitalization: widget.isPassword
          ? TextCapitalization.none
          : (widget.textCapitalization ?? TextCapitalization.none),
      style:
          widget.customTextStyle ??
          context.hint?.copyWith(
            decorationColor: _colors.text.inverse,
            color: _error
                ? _colors.feedback.error
                : widget.readOnly
                ? _colors.text.tertiary
                : _colors.text.main,
          ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        isDense: false,
        counterText: '',
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: context.colors.background.secondary,
        alignLabelWithHint: true,
        labelText: widget.hintText,
        labelStyle: context.hint,
        prefixIcon: widget.prefix,
        suffixIcon: widget.onClearTapped == null || _textController.text.isEmpty
            ? null
            : IconButton(
                onPressed: _onClearTapped,
                icon: Icon(Icons.close_rounded, color: context.colors.icon.main),
              ),
        border: _error ? _errorBorder : _regularBorder,
        disabledBorder: _error ? _errorBorder : _regularBorder,
        focusedBorder: _error ? _errorBorder : _focusedBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        enabledBorder: _error
            ? _errorBorder
            : _textController.text.isEmpty
            ? _regularBorder
            : _focusedBorder,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(widget.title!, style: context.username),
          ),
        Focus(
          onFocusChange: (_) => setState(() {}),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
              // Single-line: fixed design height. Multiline: intrinsic grow up to maxLines.
              child: isMultiline
                  ? textField
                  : SizedBox(height: Values.textFieldHeight, child: textField),
            ),
          ),
        ),
        if (_error && (_errorText ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
              child: Text(
                _errorText!,
                maxLines: 10,
                style: context.caption?.copyWith(
                  color: _colors.feedback.error,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _onClearTapped() {
    if (_focusNode.hasFocus) _focusNode.unfocus();
    widget.onClearTapped?.call();
    _textController.text = '';
  }
}
