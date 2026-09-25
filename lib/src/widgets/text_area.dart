import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter/widget_previews.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/paragraph_typography.dart";

/// Provides a themed multiline text input field.
///
/// [placeholder] is displayed when the input is empty.
/// [controller] manages the text entered into the field.
/// [focusNode] manages the focus state of the field.
/// [onChanged] is called whenever the text changes.
///
/// The text field uses the current [TeresaTheme] for its text, hint, cursor,
/// and text selection colors.
///
/// Example:
///
/// ```dart
/// TextArea(
///   placeholder: "Type some text here",
///   controller: controller,
///   focusNode: focusNode,
///   onChanged: (value) {
///     // Handle the updated text.
///   },
/// );
/// ```
class TextArea extends StatefulWidget {
  /// The placeholder displayed when the text area is empty.
  final String placeholder;

  /// Controls the text entered into the text area.
  final TextEditingController controller;

  /// Controls the focus state of the text area.
  final FocusNode focusNode;

  /// Called whenever the text in the text area changes.
  final ValueChanged<String> onChanged;

  /// Creates a themed multiline text area.
  const TextArea({
    super.key,
    required this.placeholder,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<TextArea> createState() {
    return _TextAreaState();
  }
}

class _TextAreaState extends State<TextArea> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    return material.Material(
      color: NeutralColor.TRANSPARENT,
      child: material.Theme(
        data: material.Theme.of(context).copyWith(
          textSelectionTheme: material.TextSelectionThemeData(
            selectionColor: teresaTheme.textEmphasis9Color.withValues(
              alpha: 0.3,
            ),
            selectionHandleColor: teresaTheme.textEmphasis9Color,
            cursorColor: teresaTheme.textEmphasis9Color,
          ),
        ),
        child: material.TextField(
          controller: widget.controller,
          decoration: material.InputDecoration(
            hintText: widget.placeholder,
            contentPadding: const material.EdgeInsets.all(16),
            border: material.InputBorder.none,
            hintStyle: ParagraphTypography.REGULAR_16(
              teresaTheme.textEmphasis6Color,
            ),
          ),
          style: ParagraphTypography.REGULAR_16(teresaTheme.textEmphasis9Color),
          keyboardType: material.TextInputType.multiline,
          maxLines: null,
          cursorColor: teresaTheme.textEmphasis9Color,
          focusNode: widget.focusNode,
          onTapOutside: (_) {
            widget.focusNode.unfocus();
          },
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}

@Preview()
Widget preview() {
  return SizedBox(
    height: WIDGET_PREVIEW_MAXIMUM_SIZE,
    width: WIDGET_PREVIEW_MAXIMUM_SIZE,
    child: TextArea(
      placeholder: "Type some text here",
      controller: TextEditingController(),
      focusNode: FocusNode(),
      onChanged: (_) {},
    ),
  );
}
