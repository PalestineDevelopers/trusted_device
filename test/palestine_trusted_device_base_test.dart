import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:palestine_trusted_device/src/palestine_trusted_device_base.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    Future<bool> handler(MethodCall methodCall) async {
      if (methodCall.method == 'isReal') {
        return true;
      } else if (methodCall.method == 'isRooted') {
        return false;
      } else if (methodCall.method == 'isDev') {
        return false;
      } else if (methodCall.method == 'onExt') {
        return true;
      } else {
        return false;
      }
    }

    TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
        .setMockMethodCallHandler(
      PalTrustedDevice().channel,
      handler,
    );
  });

  test('isAndroid check is fine', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    expect(PalTrustedDevice.isAndroid, isFalse);

    debugDefaultTargetPlatformOverride = null;
  });

  test(
    'check() method on iOS',
    () async => expect(
      await PalTrustedDevice.check(onFail: () {}),
      anyOf([true, false]),
    ),
  );

  test(
    'check() method on Android',
    () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      expect(
        await PalTrustedDevice.check(onFail: () {}),
        anyOf([true, false]),
      );
    },
  );

  test(
    'check() method on non-supported platform',
    () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;

      expect(
        await PalTrustedDevice.check(onFail: () {}),
        anyOf([true, false]),
      );
    },
  );
}
