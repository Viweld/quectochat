import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/extensions/context_extensions.dart';
import '../theme/dynamic_theme.dart';
import '../values/palette.dart';
import '../values/values.dart';

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
    this.onChanged,
    this.onUnfocused,
    this.focusNode,
    this.suffix,
    this.maxLength,
    this.validationErrorText,
    this.validationError = false,
    this.isEnabled = true,
    this.onTapOutside,
    this.inputFormatters,
    this.title,
    this.isPassword = false,
    this.customTextStyle,
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

  /// Обратный вызов, который будет вызываться при прекращении ввода.
  final VoidCallback? onUnfocused;

  /// Обратный вызов, который будет вызываться при изменении текста в поле ввода (срабатывает при изменении каждого символа).
  final Function(String)? onChanged;

  /// Фокусный узел. Управляет фокусом поля ввода.
  final FocusNode? focusNode;

  /// Виджет, отображаемый после текста внутри поля ввода.
  final Widget? suffix;

  /// Максимальное количество символов, которое можно ввести в поле.
  final int? maxLength;

  /// Текст ошибки, который будет отображаться, если введенное значение недопустимо.
  final String? validationErrorText;

  /// Состояние ошибки валидации, если [true] - рамка и введенный текст выделяются красным. Текст ошибки отсутствует.
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

  static const double height = 50;
  static const double borderThickness = 1;

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
        borderSide: BorderSide(
          color: _palette.gray,
          width: CommonEditField.borderThickness,
        ),
      );

  InputBorder get _focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
        borderSide: BorderSide(
          color: _palette.gray,
          width: CommonEditField.borderThickness,
        ),
      );

  InputBorder get _errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(Values.textFieldBorderRadius),
        borderSide: BorderSide(
          color: _palette.red,
          width: CommonEditField.borderThickness,
        ),
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
        ..selection =
            TextSelection.collapsed(offset: _textController.text.length);
    }
  }

  void _textControllerListener() => setState(() {});

  void _focusNodeListener() {
    if (!_focusNode.hasFocus) widget.onUnfocused?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Заголовок
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              widget.title!,
              style: context.style15w600$username,
            ),
          ),

        /// Поле ввода
        Focus(
          onFocusChange: (_) => setState(() {}),
          child: SizedBox(
            height: CommonEditField.height,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Values.textFieldBorderRadius,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  Values.textFieldBorderRadius,
                ),
                child: TextField(
                  magnifierConfiguration: TextMagnifierConfiguration.disabled,
                  onTapOutside: (event) {
                    _focusNode.unfocus();
                    if (widget.onTapOutside != null) {
                      widget.onTapOutside!(event);
                    }
                  },
                  expands: false,
                  focusNode: _focusNode,
                  maxLength: widget.maxLength,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: widget.align,
                  // в используемом шрифте символ \u2022 постоянно прыгает при вводе
                  obscuringCharacter: '\u2055',
                  obscureText: widget.isPassword,
                  controller: _textController,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,
                  onChanged: (t) {
                    widget.onChanged?.call(t);
                    setState(() => _error = false);
                  },
                  enabled: widget.isEnabled,
                  keyboardType: widget.isPassword
                      ? TextInputType.text
                      : widget.keyboardType,
                  textCapitalization: widget.isPassword
                      ? TextCapitalization.none
                      : (widget.textCapitalization ?? TextCapitalization.none),
                  minLines: 1,
                  maxLines: 1,
                  style: widget.customTextStyle ??
                      context.style16w500$hint?.copyWith(
                        decorationColor: _palette.white,
                        color: _error
                            ? _palette.red
                            : widget.readOnly
                                ? _palette.gray
                                : _palette.black,
                      ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    isDense: false,
                    counterText: '',
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.transparent,
                    alignLabelWithHint: true,
                    labelText: widget.hintText,
                    labelStyle: context.style16w500$hint,
                    suffixIcon: widget.suffix,

                    // Границы
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
                ),
              ),
            ),
          ),
        ),

        if (_error && (_errorText ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _errorText!,
                maxLines: 10,
                style: context.style12w500$labels?.copyWith(
                  color: _palette.red,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
