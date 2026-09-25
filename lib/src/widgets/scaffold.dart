import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/widgets/action_button.dart";

/// Provides the standard page structure used by Teresa applications.
///
/// The scaffold displays [body] inside a safe, centered application window
/// with a maximum width of 1280 pixels. It also provides a top navigation area
/// containing a back button and optional [actionButtons].
///
/// [onBackButtonTap] is called when the back button is tapped.
/// [backButtonTooltipMessage] is displayed as the back button's tooltip.
/// [backButtonAccessibilityLabel] provides the back button's accessibility
/// label.
///
/// The scaffold uses the current [TeresaTheme] for its background color.
///
/// Example:
///
/// ```dart
/// Scaffold(
///   onBackButtonTap: () {
///     // Navigate back.
///   },
///   backButtonTooltipMessage: "Go back",
///   backButtonAccessibilityLabel: "Return to the previous screen",
///   actionButtons: [
///     ActionButton(
///       icon: Symbols.history_2,
///       tooltipMessage: "Reset changes",
///       accessibilityLabel: "Reset changes",
///       onTap: () {},
///     ),
///   ],
///   body: const MyPageContent(),
/// );
/// ```
class Scaffold extends StatefulWidget {
  /// Called when the back button is tapped.
  final VoidCallback onBackButtonTap;

  /// Action buttons displayed on the right side of the top navigation area.
  final List<Widget> actionButtons;

  /// The tooltip message displayed by the back button.
  final String backButtonTooltipMessage;

  /// The accessibility label of the back button.
  final String backButtonAccessibilityLabel;

  /// The main content displayed by the scaffold.
  final Widget body;

  /// Creates a Teresa scaffold with a back button, optional action buttons,
  /// and page content.
  const Scaffold({
    super.key,
    required this.onBackButtonTap,
    this.actionButtons = const [],
    required this.backButtonTooltipMessage,
    required this.backButtonAccessibilityLabel,
    required this.body,
  });

  @override
  State<StatefulWidget> createState() {
    return _ScaffoldState();
  }
}

class _ScaffoldState extends State<Scaffold> {
  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);
    final applicationWindowSize = MediaQuery.of(context).size;

    return Container(
      height: applicationWindowSize.height,
      width: applicationWindowSize.width,
      decoration: BoxDecoration(color: teresaTheme.surface.backgroundColor),
      child: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Stack(
              children: [
                widget.body,
                Positioned(
                  top: 16,
                  left: 16,
                  right: 16,
                  height: 64,
                  child: Row(
                    children: [
                      ActionButton(
                        icon: Symbols.arrow_back_ios_new_rounded,
                        tooltipMessage: widget.backButtonTooltipMessage,
                        accessibilityLabel: widget.backButtonAccessibilityLabel,
                        isHapticFeedbackEnabled: false,
                        onTap: widget.onBackButtonTap,
                      ),
                      const Spacer(),
                      ...widget.actionButtons,
                    ],
                  ),
                ),
              ],
            ),
          ),
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
    child: Scaffold(
      onBackButtonTap: () {},
      actionButtons: [
        ActionButton(
          icon: Symbols.history_2,
          tooltipMessage: "Reset changes",
          accessibilityLabel: "",
          onTap: () {},
        ),
      ],
      backButtonTooltipMessage: "Go back",
      backButtonAccessibilityLabel: "Return to the previous screen",
      body: Container(),
    ),
  );
}
