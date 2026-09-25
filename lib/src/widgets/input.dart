import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter/widget_previews.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";

/// Provides a themed single-line text input field.
///
/// [isCentralized] determines whether the entered text is centered or aligned
/// to the start of the input field.
/// [hintText] is displayed when the input is empty.
/// [type] defines the intended keyboard input type.
/// [controller] manages the text entered into the field.
/// [focusNode] manages the focus state of the field.
/// [onChanged] is called whenever the text changes.
///
/// The input uses the current [TeresaTheme] for its text, placeholder,
/// background, cursor, and text selection colors.
///
/// Example:
///
/// ```dart
/// final controller = TextEditingController();
/// final focusNode = FocusNode();
///
/// Input(
///   hintText: "Enter an age",
///   type: TextInputType.number,
///   controller: controller,
///   focusNode: focusNode,
///   onChanged: (value) {
///     // Handle the updated value.
///   },
/// );
/// ```
class Input extends StatefulWidget {
  /// Whether the entered text is centered within the input field.
  final bool isCentralized;

  /// The hint text displayed when the input is empty.
  final String hintText;

  /// The intended input type for the field.
  final TextInputType type;

  /// Controls the text entered into the input field.
  final TextEditingController controller;

  /// Controls the focus state of the input field.
  final FocusNode focusNode;

  /// Called whenever the input text changes.
  final ValueChanged<String> onChanged;

  /// Creates a themed input field.
  ///
  /// [isCentralized] defaults to `false`, causing the input text to be
  /// aligned to the start of the field.
  const Input({
    super.key,
    this.isCentralized = false,
    required this.type,
    required this.hintText,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<Input> createState() {
    return _InputState();
  }
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return material.Material(
      color: NeutralColor.TRANSPARENT,
      child: material.Theme(
        data: material.Theme.of(context).copyWith(
          textSelectionTheme: material.TextSelectionThemeData(
            selectionColor: teresaTheme.input.color.withValues(alpha: 0.3),
            selectionHandleColor: teresaTheme.input.color,
          ),
        ),
        child: SizedBox(
          height: 56,
          child: material.TextField(
            controller: widget.controller,
            decoration: material.InputDecoration(
              hintText: widget.hintText,
              contentPadding: const material.EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 26,
              ),
              border: material.OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: material.BorderSide.none,
                gapPadding: 0,
              ),
              filled: true,
              hoverColor: teresaTheme.input.backgroundColor,
              focusColor: teresaTheme.input.backgroundColor,
              fillColor: teresaTheme.input.backgroundColor,
              hintStyle: HeaderTypography.HEADING_4(
                teresaTheme.input.placeholderColor,
              ),
            ),
            style: HeaderTypography.HEADING_4(teresaTheme.input.color),
            textAlignVertical: TextAlignVertical.center,
            textAlign: widget.isCentralized
                ? TextAlign.center
                : TextAlign.start,
            keyboardType: TextInputType.number,
            cursorColor: teresaTheme.input.color,
            focusNode: widget.focusNode,
            onTapOutside: (_) {
              widget.focusNode.nextFocus();

              widget.focusNode.unfocus();
            },
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return SizedBox(
    width: WIDGET_PREVIEW_MAXIMUM_SIZE,
    child: Input(
      hintText: "Enter an age",
      type: TextInputType.number,
      controller: TextEditingController(),
      focusNode: FocusNode(),
      onChanged: (_) {},
    ),
  );
}
