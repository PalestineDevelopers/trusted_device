# palestine_trusted_device

## Part of [PalestineDevelopers](https://github.com/PalestineDevelopers)

Device security checker, isRooted/isJailbroken, isRealDevice, devModeActive or onExternalStorage.

[![License](https://img.shields.io/github/license/PalestineDevelopers/trusted_device)](https://github.com/PalestineDevelopers)
[![Pub](https://img.shields.io/badge/Palestine%20Trusted%20Device-pub-blue)](https://pub.dev/packages/palestine_trusted_device)
[![Example](https://img.shields.io/badge/Example-Ex-success)](https://pub.dev/packages/palestine_trusted_device/example)

[![Fork](https://img.shields.io/github/forks/PalestineDevelopers/trusted_device?style=social)](https://github.com/PalestineDevelopers/trusted_device)
[![Star](https://img.shields.io/github/stars/PalestineDevelopers/trusted_device?style=social)](https://github.com/PalestineDevelopers/trusted_device)
[![Watch](https://img.shields.io/github/watchers/PalestineDevelopers/trusted_device?style=social)](https://github.com/PalestineDevelopers/trusted_device)

---

## Table Of Contents

* [Features](#features)
* [Getting started](#getting-started)
* [Usage](#usage)

---

## Features

* Android/IOS security checks:
  * isRooted/isJailbroken
  * isRealDevice
  * isInDevMode
  * isOnExternalStorage

---

## Getting started

To start, import package

```dart
import 'package:palestine_trusted_device/palestine_trusted_device.dart';
```

---

## Usage

Ensure flutter framework is active

* Add this to the beginning of `main()`

```dart
// Make Sure Framework Is Ready
WidgetsFlutterBinding.ensureInitialized();
```

Just as easy as this

```dart
PalTrustedDevice.check(
      onFail: () {
        // Not Secure Env Detected
      },
    );
```

Customizing checks available too

```dart
PalTrustedDevice.check(
      checkRealDevice: true, // Android + IOS
      checkDevMode: false, // Android
      checkOnExternalStorage: false, // Android
      checkRooted: true, // Android + IOS
      onFail: () {
        // Not Secure Env Detected
      },
    );
```

It's possible to await until the check is done

```dart
await PalTrustedDevice.check(
      onFail: () {
        // Not Secure Env Detected
      },
    );
```
