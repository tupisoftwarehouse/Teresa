import "dart:async";

import "package:flutter/widget_previews.dart";
import "package:flutter/widgets.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/agnostic_widgets/surface.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/inherited_widgets/teresa_theme.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/teresa_theme/colors/neutral_color.dart";
import "package:teresa/src/teresa_theme/colors/success_color.dart";
import "package:teresa/src/teresa_theme/typography_styles/header_typography.dart";
import "package:teresa/src/teresa_theme/typography_styles/label_typography.dart";
import "package:teresa/src/widgets/action_button.dart";

/// Displays a temporary notification with a message, description, and
/// optional action.
///
/// The snackbar automatically dismisses after
/// [SNACKBAR_AUTOMATIC_DISMISS_DURATION]. When the dismissal completes,
/// [onTimeout] is called.
///
/// [message] is the primary text displayed by the snackbar.
/// [description] is the secondary text displayed below the message.
/// [icon] is displayed inside the action button.
/// [buttonAccessibilityLabel] provides the semantic label for the action
/// button.
/// [buttonTooltipMessage] is displayed as the action button's tooltip.
/// [onTap] is called when the action button is tapped.
/// [onTimeout] is called when the snackbar is automatically dismissed.
///
/// Example:
///
/// ```dart
/// Snackbar(
///   message: "Equation history has been cleared",
///   description: "Tap restore to keep your equation history",
///   icon: Symbols.settings_backup_restore_rounded,
///   buttonAccessibilityLabel: "Restore deleted equations",
///   buttonTooltipMessage: "Restore equations",
///   onTap: () {
///     // Restore the deleted data.
///   },
///   onTimeout: () {
///     // Handle automatic dismissal.
///   },
/// );
/// ```
class Snackbar extends StatefulWidget {
  /// The primary message displayed by the snackbar.
  final String message;

  /// The secondary description displayed below the message.
  final String description;

  /// The icon displayed inside the action button.
  final IconData icon;

  /// The accessibility label of the action button.
  final String buttonAccessibilityLabel;

  /// The tooltip message displayed for the action button.
  final String buttonTooltipMessage;

  /// Called when the action button is tapped.
  final VoidCallback onTap;

  /// Called after the snackbar is automatically dismissed.
  final VoidCallback onTimeout;

  /// Creates a temporary snackbar notification.
  const Snackbar({
    super.key,
    required this.message,
    required this.description,
    required this.icon,
    required this.buttonAccessibilityLabel,
    required this.buttonTooltipMessage,
    required this.onTap,
    required this.onTimeout,
  });

  @override
  State<StatefulWidget> createState() {
    return _SnackbarState();
  }
}

class _SnackbarState extends State<Snackbar> {
  final _isShown = ValueNotifier(false);
  final _isElementShown = ValueNotifier(false);
  Timer? _isShownTimer;
  Timer? _isElementShownTimer;

  @override
  void dispose() {
    _isShown.dispose();
    _isElementShown.dispose();

    _isShownTimer?.cancel();
    _isElementShownTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final teresaTheme = TeresaTheme.of(context);

    _isShown.value = false;
    _isElementShown.value = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isShown.value = true;
      _isElementShown.value = true;

      _isShownTimer = Timer(SNACKBAR_AUTOMATIC_DISMISS_DURATION, () {
        _isShown.value = false;

        _isElementShownTimer = Timer(AnimationDuration.LONG, () {
          _isElementShown.value = false;

          widget.onTimeout();
        });
      });
    });

    return SizedBox(
      height: 96,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final snackbarMessageContainerWidth = constraints.maxWidth - 72;

          return ValueListenableBuilder(
            valueListenable: _isShown,
            builder: (_, isShown, _) {
              return SizedBox(
                height: double.infinity,
                width: constraints.maxWidth,
                child: Padding(
                  padding: const EdgeInsetsGeometry.all(0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        height: 64,
                        width: isShown ? snackbarMessageContainerWidth : 0,
                        duration: AnimationDuration.LONG,
                        curve: Curves.easeInOutCirc,
                        child: ValueListenableBuilder(
                          valueListenable: _isElementShown,
                          builder: (_, isElementShown, _) {
                            return isElementShown
                                ? Surface(
                                    backgroundColor: teresaTheme
                                        .elevatedSurface
                                        .backgroundColor,
                                    borderColor:
                                        teresaTheme.elevatedSurface.borderColor,
                                    borderRadius: BorderRadius.circular(1000),
                                    height: 64,
                                    width: 50,
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsGeometry.symmetric(
                                            horizontal: 32,
                                          ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.message,
                                            style: HeaderTypography.HEADING_6(
                                              teresaTheme.textEmphasis9Color,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            widget.description,
                                            style: LabelTypography.SEMIBOLD_12(
                                              teresaTheme.textEmphasis3Color,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 64,
                        width: 64,
                        child: Center(
                          child: AnimatedScale(
                            scale: isShown ? 1 : 0,
                            duration: AnimationDuration.LONG,
                            curve: Curves.easeInOutCirc,
                            child: ValueListenableBuilder(
                              valueListenable: _isElementShown,
                              builder: (_, isElementShown, _) {
                                return isElementShown
                                    ? ActionButton(
                                        icon: widget.icon,
                                        backgroundColor: SuccessColor.VALUE_500,
                                        borderColor: SuccessColor.VALUE_600,
                                        iconColor: SuccessColor.VALUE_900,
                                        indicatorColor: NeutralColor.VALUE_900,
                                        accessibilityLabel:
                                            widget.buttonAccessibilityLabel,
                                        tooltipMessage:
                                            widget.buttonTooltipMessage,
                                        onTap: () {
                                          widget.onTap();

                                          _isShown.value = false;

                                          _isElementShownTimer = Timer(
                                            AnimationDuration.LONG,
                                            () {
                                              _isElementShown.value = false;
                                            },
                                          );
                                        },
                                      )
                                    : const SizedBox.shrink();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

@Preview()
Widget preview() {
  return SizedBox(
    width: WIDGET_PREVIEW_MAXIMUM_SIZE,
    child: Snackbar(
      message: "Equation history has been cleared",
      description: "Tap restore to keep your equation history",
      icon: Symbols.settings_backup_restore_rounded,
      buttonAccessibilityLabel: "Restore deleted equations",
      buttonTooltipMessage: "Restore equations",
      onTap: () {},
      onTimeout: () {},
    ),
  );
}
