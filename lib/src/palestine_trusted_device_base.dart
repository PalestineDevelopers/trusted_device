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
    bool rooted = true,
    bool emulator = true,
    bool onExtStorage = true,
    bool devMode = true,
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

    final List<bool> checks = [
      emulator && await invoke('isEmulator'),
      rooted && await invoke('isRooted'),
      devMode && await invoke('isDev'), // ! ANDROID ONLY
      onExtStorage && await invoke('onExt'), // ! ANDROID ONLY
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

  static Future<bool> invoke(String method) async {
    final MethodChannel _channel = PalTrustedDevice().channel;

    return (await _channel.invokeMethod(method)) == true;
  }
}
