import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PalTrustedDevice {
  /// * CHANNEL THAT RETURN CHECK RESULTS
  /// ! DO NOT CHANGE THE KEY UNDER ANY CIRCUMSTANCES AT ALL
  /// ! CHANGE THE VALUE WILL CAUSE CHECK ERRORS
  MethodChannel channel = const MethodChannel('palestine_trusted_device');

  /// * LIST OF SUPPORTED PLATFORMS
  static const List<TargetPlatform> supportedPlatforms = [
    TargetPlatform.android,
    TargetPlatform.iOS,
  ];

  /// * IS DEVICE ANDROID
  static bool isAndroid = TargetPlatform.android == defaultTargetPlatform;

  /// * IS DEVICE SAFE
  static bool isDeviceSafe = true;

  ///---
  /// check device is safe and secure
  ///---
  /// checkRooted | checkRealDevice | checkOnExternalStorage | checkDevMode
  static Future<bool> check({
    bool checkRooted = true,
    bool checkRealDevice = true,
    bool checkOnExternalStorage = true,
    bool checkDevMode = true,
    required VoidCallback onFail,
  }) async {
    // * If not supported .. fallback
    if (!supportedPlatforms.contains(defaultTargetPlatform)) {
      developer.log(
        '--PalestineTrustedDevice-- DEVICE NOT SUPPORTED',
        name: 'SECURITY',
      );
      return isDeviceSafe;
    }

    final MethodChannel _channel = PalTrustedDevice().channel;

    final List<bool> checks = [
      checkRealDevice &&
          (await _channel.invokeMethod('isReal') ?? true) == false,
      checkRooted && (await _channel.invokeMethod('isRooted') ?? false),
      // ! ANDROID ONLY
      checkDevMode && (await _channel.invokeMethod('isDev') ?? false),
      // ! ANDROID ONLY
      checkOnExternalStorage && (await _channel.invokeMethod('onExt') ?? false),
    ];

    isDeviceSafe = !checks.contains(true);

    if (!isDeviceSafe) {
      developer.log(
        '--PalestineTrustedDevice-- (SECURITY) - DEVICE NOT SAFE',
        name: 'SECURITY',
      );
      onFail();
    }

    return isDeviceSafe;
  }
}
