import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/theme/app_fonts.dart';
import 'package:shared_ui/src/theme/colors/app_colors_theme.dart';

/// Составное поле ввода кода (OTP / invite) на базе `pinput`.
class CommonPinField extends StatefulWidget {
  const CommonPinField({
    super.key,
    required this.length,
    this.onChanged,
    this.onCompleted,
    this.errorText,
    this.enabled = true,
    this.autofocus = true,
    this.controller,
    this.focusNode,
    this.separatorAfterIndex,
    this.inputFormatters,
    this.keyboardType = TextInputType.visiblePassword,
    this.textCapitalization = TextCapitalization.characters,
    this.cellWidth = 36,
    this.cellHeight = 44,
  });

  final int length;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final String? errorText;
  final bool enabled;
  final bool autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  /// After this 0-based index a hyphen separator is shown (e.g. 3 → XXXX-XXXX).
  final int? separatorAfterIndex;
  final List<TextInputFormatter>? inputFormatters;

  /// Defaults to visiblePassword so mobile shows an alphanumeric keyboard.
  final TextInputType keyboardType;

  /// Defaults to characters so letters appear/shift as uppercase.
  final TextCapitalization textCapitalization;
  final double cellWidth;
  final double cellHeight;

  @override
  State<CommonPinField> createState() => _CommonPinFieldState();
}

class _CommonPinFieldState extends State<CommonPinField> {
  FocusNode? _ownedFocusNode;

  FocusNode get _focusNode => widget.focusNode ?? _ownedFocusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _ownedFocusNode = FocusNode();
    }
  }

  @override
  void dispose() {
    _ownedFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String? errorText = widget.errorText != null && widget.errorText!.isNotEmpty
        ? widget.errorText
        : null;

    return Pinput(
      length: widget.length,
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
      forceErrorState: errorText != null,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      enableSuggestions: false,
      inputFormatters:
          widget.inputFormatters ??
          <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9]')),
            _UpperCaseTextFormatter(),
          ],
      separatorBuilder: widget.separatorAfterIndex == null
          ? null
          : (int index) {
              if (index == widget.separatorAfterIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('-', style: AppFonts.username.copyWith(color: colors.text.main)),
                );
              }
              return const SizedBox(width: 6);
            },
      cursor: Container(height: 16, width: 2, color: colors.accent.main),
      defaultPinTheme: _pinTheme(borderColor: colors.border.main, textColor: colors.text.main),
      focusedPinTheme: _pinTheme(borderColor: colors.accent.main, textColor: colors.text.main),
      errorPinTheme: _pinTheme(borderColor: colors.feedback.error, textColor: colors.text.main),
      disabledPinTheme: _pinTheme(borderColor: colors.border.main, textColor: colors.text.tertiary),
      errorBuilder: (String? text, String pin) {
        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            text ?? errorText ?? '',
            textAlign: TextAlign.center,
            style: AppFonts.caption.copyWith(color: colors.feedback.error),
          ),
        );
      },
    );
  }

  PinTheme _pinTheme({required Color borderColor, required Color textColor}) {
    return PinTheme(
      width: widget.cellWidth,
      height: widget.cellHeight,
      textStyle: AppFonts.username.copyWith(height: 1, color: textColor),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

final class _UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
