import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart";
import "package:flutter_test/flutter_test.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_container.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"DropdownMenuContainer\" Widget", () {
    late LayerLink layerLink;
    late ValueNotifier<bool> isShown;

    setUp(() {
      layerLink = LayerLink();

      isShown = ValueNotifier(true);
    });

    testWidgets(
      "Test If Widget Removes Dropdown Menu Container Overlay Entry On Container Tapped",
      (WidgetTester tester) async {
        bool isOverlayEntryRemoved = false;

        await tester.pumpWidget(
          WidgetTestingWrapper(
            child: Stack(
              children: [
                DropdownMenuContainer(
                  layerLink: layerLink,
                  isShown: isShown,
                  items: [
                    DropdownMenuItem(
                      label: WIDGET_PRIMARY_TEXT,
                      abbreviation: WIDGET_SECONDARY_TEXT,
                      isSelected: false,
                      accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                      onTap: () {},
                    ),
                  ],
                  dropdownMenuWidth: DROPDOWN_MENU_WIDTH,
                  removeMenuDropdownOverlayEntry: () {
                    isOverlayEntryRemoved = true;
                  },
                ),
              ],
            ),
          ),
        );

        await tester.tap(find.byType(GestureDetector).first);

        expect(isOverlayEntryRemoved, true);
      },
    );

    testWidgets(
      "Test If Widget Removes Dropdown Menu Container Overlay Entry On Item Tapped",
      (WidgetTester tester) async {
        bool isOverlayEntryRemoved = false;

        await tester.pumpWidget(
          material.MaterialApp(
            home: material.Scaffold(
              body: Stack(
                children: [
                  DropdownMenuContainer(
                    layerLink: layerLink,
                    isShown: isShown,
                    items: [
                      DropdownMenuItem(
                        label: WIDGET_PRIMARY_TEXT,
                        abbreviation: WIDGET_SECONDARY_TEXT,
                        isSelected: false,
                        accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                        onTap: () {},
                      ),
                    ],
                    dropdownMenuWidth: DROPDOWN_MENU_WIDTH,
                    removeMenuDropdownOverlayEntry: () {
                      isOverlayEntryRemoved = true;
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        await tester.tap(find.byType(DropdownMenuItem), warnIfMissed: false);

        expect(isOverlayEntryRemoved, true);
      },
    );
  });
}
