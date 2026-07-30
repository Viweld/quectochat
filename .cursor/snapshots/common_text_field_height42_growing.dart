import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/theme/dynamic_theme.dart';
import 'package:shared_ui/src/values/palette.dart';
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

  static const EdgeInsets contentPadding = EdgeInsets.fromLTRB(16, 10, 16, 10);

  @override
  State<CommonEditField> createState() => _CommonEditFieldState();
}

class _CommonEditFieldState extends State<CommonEditField> {
  late TextEditingController _textController;
  late FocusNode _focusNode;
  late String? _errorText;
  late bool _error;
  late Palette _palette;

  InputBorder get _regularBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
    borderSide: BorderSide(color: _palette.stroke),
  );

  InputBorder get _focusedBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
    borderSide: BorderSide(color: _palette.stroke),
  );

  InputBorder get _errorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
    borderSide: BorderSide(color: _palette.red),
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
    _palette = DynamicTheme.paletteOf(context);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(CommonEditField oldWidget) {
    _palette = DynamicTheme.paletteOf(context);

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
    final TextStyle textStyle =
        widget.customTextStyle ??
        context.hint?.copyWith(
          decorationColor: _palette.white,
          color: _error
              ? _palette.red
              : widget.readOnly
              ? _palette.gray
              : _palette.black,
        ) ??
        const TextStyle();

    final _EditFieldConfig config = _EditFieldConfig(
      focusNode: _focusNode,
      controller: _textController,
      textStyle: textStyle,
      align: widget.align,
      readOnly: widget.readOnly,
      isPassword: widget.isPassword,
      isEnabled: widget.isEnabled,
      maxLength: widget.maxLength,
      hintText: widget.hintText,
      prefix: widget.prefix,
      showClear: widget.onClearTapped != null && _textController.text.isNotEmpty,
      onClearTapped: _onClearTapped,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      onChanged: (String t) {
        widget.onChanged?.call(t);
        setState(() => _error = false);
      },
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      regularBorder: _error ? _errorBorder : _regularBorder,
      focusedBorder: _error ? _errorBorder : _focusedBorder,
      errorBorder: _errorBorder,
      enabledBorder: _error
          ? _errorBorder
          : _textController.text.isEmpty
          ? _regularBorder
          : _focusedBorder,
      fillColor: context.palette.stroke,
      hintStyle: context.hint,
      clearIconColor: context.palette.black,
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
              child: isMultiline
                  ? _GrowingMultilineEditField(
                      config: config,
                      text: _textController.text,
                      minLines: widget.minLines,
                      maxLines: widget.maxLines ?? widget.minLines,
                    )
                  : SizedBox(
                      height: Values.textFieldHeight,
                      child: _EditTextField(
                        config: config,
                        isMultiline: false,
                        expands: false,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
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
                  color: _palette.red,
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

/// Shared knobs for the inner [TextField] so single- and multiline shells stay in sync.
final class _EditFieldConfig {
  const _EditFieldConfig({
    required this.focusNode,
    required this.controller,
    required this.textStyle,
    required this.align,
    required this.readOnly,
    required this.isPassword,
    required this.isEnabled,
    required this.maxLength,
    required this.hintText,
    required this.prefix,
    required this.showClear,
    required this.onClearTapped,
    required this.onTap,
    required this.onTapOutside,
    required this.onChanged,
    required this.keyboardType,
    required this.textCapitalization,
    required this.regularBorder,
    required this.focusedBorder,
    required this.errorBorder,
    required this.enabledBorder,
    required this.fillColor,
    required this.hintStyle,
    required this.clearIconColor,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final TextStyle textStyle;
  final TextAlign align;
  final bool readOnly;
  final bool isPassword;
  final bool isEnabled;
  final int? maxLength;
  final String? hintText;
  final Widget? prefix;
  final bool showClear;
  final VoidCallback onClearTapped;
  final VoidCallback? onTap;
  final Function(PointerDownEvent)? onTapOutside;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final InputBorder regularBorder;
  final InputBorder focusedBorder;
  final InputBorder errorBorder;
  final InputBorder enabledBorder;
  final Color fillColor;
  final TextStyle? hintStyle;
  final Color clearIconColor;
}

/// Grows from [Values.textFieldHeight] up to [maxLines], then scrolls internally.
class _GrowingMultilineEditField extends StatelessWidget {
  const _GrowingMultilineEditField({
    required this.config,
    required this.text,
    required this.minLines,
    required this.maxLines,
  });

  final _EditFieldConfig config;
  final String text;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final TextScaler textScaler = MediaQuery.textScalerOf(context);
        final TextDirection textDirection = Directionality.of(context);
        final double lineHeight = _preferredLineHeight(
          style: config.textStyle,
          textScaler: textScaler,
          textDirection: textDirection,
        );
        final double textMaxWidth = max(
          0,
          constraints.maxWidth -
              CommonEditField.contentPadding.horizontal -
              // Outline border eats width on both sides; underestimating width
              // delays height growth until several glyphs wrap on the next line.
              CommonEditField.borderThickness * 2,
        );
        final int wrappedLines = _wrappedLineCount(
          text: text,
          style: config.textStyle,
          maxWidth: textMaxWidth,
          textScaler: textScaler,
          textDirection: textDirection,
        );
        final int visibleLines = wrappedLines.clamp(minLines, maxLines);
        // 1 visible line == design-system text field / attach / send button height.
        final double height = Values.textFieldHeight + (visibleLines - 1) * lineHeight;

        return SizedBox(
          height: height,
          child: _EditTextField(
            config: config,
            isMultiline: true,
            expands: true,
            textAlignVertical: visibleLines > 1 ? TextAlignVertical.top : TextAlignVertical.center,
          ),
        );
      },
    );
  }
}

class _EditTextField extends StatelessWidget {
  const _EditTextField({
    required this.config,
    required this.isMultiline,
    required this.expands,
    required this.textAlignVertical,
  });

  final _EditFieldConfig config;
  final bool isMultiline;
  final bool expands;
  final TextAlignVertical textAlignVertical;

  @override
  Widget build(BuildContext context) {
    return TextField(
      magnifierConfiguration: TextMagnifierConfiguration.disabled,
      onTapOutside: (PointerDownEvent event) {
        config.focusNode.unfocus();
        config.onTapOutside?.call(event);
      },
      focusNode: config.focusNode,
      maxLength: config.maxLength,
      expands: expands,
      minLines: expands ? null : 1,
      maxLines: expands ? null : 1,
      textAlignVertical: textAlignVertical,
      textAlign: config.align,
      // в используемом шрифте символ \u2022 постоянно прыгает при вводе
      obscuringCharacter: '\u2055',
      obscureText: config.isPassword,
      controller: config.controller,
      readOnly: config.readOnly,
      onTap: config.onTap,
      onChanged: config.onChanged,
      enabled: config.isEnabled,
      keyboardType: config.isPassword
          ? TextInputType.text
          : (config.keyboardType ?? (isMultiline ? TextInputType.multiline : null)),
      textInputAction: isMultiline ? TextInputAction.newline : TextInputAction.done,
      textCapitalization: config.isPassword
          ? TextCapitalization.none
          : (config.textCapitalization ?? TextCapitalization.none),
      style: config.textStyle,
      decoration: InputDecoration(
        contentPadding: CommonEditField.contentPadding,
        isDense: false,
        counterText: '',
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: config.fillColor,
        alignLabelWithHint: true,
        labelText: config.hintText,
        labelStyle: config.hintStyle,
        prefixIcon: config.prefix,
        suffixIcon: config.showClear
            ? IconButton(
                onPressed: config.onClearTapped,
                icon: Icon(Icons.close_rounded, color: config.clearIconColor),
              )
            : null,
        border: config.regularBorder,
        disabledBorder: config.regularBorder,
        focusedBorder: config.focusedBorder,
        errorBorder: config.errorBorder,
        focusedErrorBorder: config.errorBorder,
        enabledBorder: config.enabledBorder,
      ),
    );
  }
}

double _preferredLineHeight({
  required TextStyle style,
  required TextScaler textScaler,
  required TextDirection textDirection,
}) {
  final TextPainter painter = TextPainter(
    text: TextSpan(text: 'Áy', style: style),
    textDirection: textDirection,
    textScaler: textScaler,
  )..layout();
  return painter.preferredLineHeight;
}

int _wrappedLineCount({
  required String text,
  required TextStyle style,
  required double maxWidth,
  required TextScaler textScaler,
  required TextDirection textDirection,
}) {
  if (text.isEmpty || maxWidth <= 0) return 1;

  // TextPainter drops a trailing empty line after '\n', but the caret already
  // sits on that next line — append a ZWSP so metrics match the editor.
  final String measureText = text.endsWith('\n') ? '$text\u200B' : text;

  final TextPainter painter = TextPainter(
    text: TextSpan(text: measureText, style: style),
    textDirection: textDirection,
    textScaler: textScaler,
  )..layout(maxWidth: maxWidth);

  final List<LineMetrics> lines = painter.computeLineMetrics();
  return max(1, lines.length);
}
