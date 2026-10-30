import "dart:ui";

import "package:flutter/services.dart";
import "package:flutter/widgets.dart";
import "package:teresa/src/internals/managers/device_language_string_manager.dart";
import "package:teresa/src/internals/transaction_scripts/application_handling/application_device_language_strings_synchronizing_transaction_script.dart";
import "package:teresa/src/device_language_string_data/device_language_string_data.dart";

class DeviceLanguageStringsWidgetsBindingObserver<T>
    implements WidgetsBindingObserver {
  final DeviceLanguageStringData<T> _deviceLanguageStringData;
  final DeviceLanguageStringManager<T> _deviceLanguageStringsManager;

  DeviceLanguageStringsWidgetsBindingObserver(
    this._deviceLanguageStringData,
    this._deviceLanguageStringsManager,
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    ApplicationDeviceLanguageStringsSynchronizingTransactionScript.synchronizeApplicationDeviceLanguageStrings(
      WidgetsBinding.instance.platformDispatcher.locale.languageCode,
      _deviceLanguageStringData,
      _deviceLanguageStringsManager,
    );
  }

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeLocales(List<Locale>? _) {
    ApplicationDeviceLanguageStringsSynchronizingTransactionScript.synchronizeApplicationDeviceLanguageStrings(
      WidgetsBinding.instance.platformDispatcher.locale.languageCode,
      _deviceLanguageStringData,
      _deviceLanguageStringsManager,
    );
  }

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {}

  @override
  void didChangeTextScaleFactor() {}

  @override
  void didHaveMemoryPressure() {}

  @override
  Future<bool> didPopRoute() async {
    return false;
  }

  @override
  Future<bool> didPushRoute(String _) async {
    return false;
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation _) async {
    return false;
  }

  @override
  void didChangeViewFocus(ViewFocusEvent _) {}

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    return AppExitResponse.exit;
  }

  @override
  void handleCancelBackGesture() {}

  @override
  void handleCommitBackGesture() {}

  @override
  bool handleStartBackGesture(PredictiveBackEvent _) {
    return false;
  }

  @override
  void handleUpdateBackGestureProgress(PredictiveBackEvent _) {}

  @override
  void handleStatusBarTap() {}
}
