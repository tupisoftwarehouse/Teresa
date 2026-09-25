import "package:flutter/material.dart" as material;
import "package:flutter_test/flutter_test.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:teresa/src/constants/user_interface_constants.dart";
import "package:teresa/src/teresa_theme/animation_duration/animation_duration.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu.dart";
import "package:teresa/src/widgets/dropdown_menu/dropdown_menu_item.dart";
import "package:teresa/src/widgets/widget_testing_wrapper.dart";

void main() {
  group("Test \"DropdownMenu\" Widget", () {
    testWidgets(
      "Test If Widget Shows Dropdown Menu Items And Item Dispatches \"onTap\" And Hides Dropdown Menu Items On Item Tapped",
      (WidgetTester tester) async {
        bool isItemTapped = false;

        await tester.pumpWidget(
          WidgetTestingWrapper(
            child: DropdownMenu(
              selectedItemAbbreviation: WIDGET_PRIMARY_TEXT,
              accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
              items: [
                DropdownMenuItem(
                  label: WIDGET_PRIMARY_TEXT,
                  abbreviation: WIDGET_SECONDARY_TEXT,
                  isSelected: false,
                  accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                  onTap: () {
                    isItemTapped = true;
                  },
                ),
              ],
            ),
          ),
        );

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

        await tester.pumpAndSettle();

        await tester.tap(find.text(WIDGET_SECONDARY_TEXT));

        await tester.pumpAndSettle();

        expect(isItemTapped, true);
      },
    );

    testWidgets(
      "Test If Widget Hides Dropdown Menu Items On Back Button Press",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          material.MaterialApp(
            home: material.Builder(
              builder: (context) {
                return material.Scaffold(
                  body: material.ElevatedButton(
                    onPressed: () {
                      material.Navigator.of(context).push(
                        material.MaterialPageRoute(
                          builder: (_) {
                            return material.Scaffold(
                              body: DropdownMenu(
                                selectedItemAbbreviation: WIDGET_PRIMARY_TEXT,
                                accessibilityLabel: WIDGET_ACCESSIBILITY_LABEL,
                                items: [
                                  DropdownMenuItem(
                                    label: WIDGET_PRIMARY_TEXT,
                                    abbreviation: WIDGET_SECONDARY_TEXT,
                                    isSelected: true,
                                    accessibilityLabel:
                                        WIDGET_ACCESSIBILITY_LABEL,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: const material.SizedBox.shrink(),
                  ),
                );
              },
            ),
          ),
        );

        await tester.tap(find.byType(material.SizedBox), warnIfMissed: false);

        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Symbols.arrow_back_ios_new_rounded));

        await tester.pumpAndSettle(AnimationDuration.MEDIUM);

        await tester.binding.handlePopRoute();

        await tester.pumpAndSettle(AnimationDuration.MEDIUM);

        expect(find.byType(DropdownMenuItem), findsNothing);
      },
    );
  });
}
