# palestine_trusted_device

## Part of [PalestineDevelopers](https://github.com/PalestineDevelopers)

Device security checker, isRooted|isJailbroken, isRealDevice, devModeActive or onExternalStorage.

[![License](https://img.shields.io/github/license/PalestineDevelopers/trusted_device?style=for-the-badge)](https://github.com/PalestineDevelopers)
[![Pub](https://img.shields.io/badge/Palestine%20Trusted%20Device-pub-blue?style=for-the-badge)](https://pub.dev/packages/palestine_trusted_device)
[![Example](https://img.shields.io/badge/Example-Ex-success?style=for-the-badge)](https://pub.dev/packages/palestine_trusted_device/example)

[![PUB](https://img.shields.io/pub/v/palestine_trusted_device.svg?style=for-the-badge)](https://pub.dev/packages/palestine_trusted_device)
[![GitHub release](https://img.shields.io/github/v/release/PalestineDevelopers/trusted_device?style=for-the-badge)](https://github.com/PalestineDevelopers/trusted_device/releases)
[![GitHub stars](https://img.shields.io/github/stars/PalestineDevelopers/trusted_device?style=for-the-badge)](https://github.com/PalestineDevelopers/trusted_device)
[![GitHub forks](https://img.shields.io/github/forks/PalestineDevelopers/trusted_device?style=for-the-badge)](https://github.com/PalestineDevelopers/trusted_device)

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FPalestineDevelopers%2Ftrusted_device%2Fbadge%3Fref%3Dmain&style=for-the-badge)](https://actions-badge.atrox.dev/PalestineDevelopers/trusted_device/goto?ref=main)

---

## Table Of Contents

- [palestine_trusted_device](#palestine_trusted_device)
  - [Part of PalestineDevelopers](#part-of-palestinedevelopers)
  - [Table Of Contents](#table-of-contents)
  - [Features](#features)
  - [Getting started](#getting-started)
  - [Usage](#usage)
  - [Contributors](#contributors)

---

## Features

- Android|IOS security checks:
- isRooted|isJailbroken
- isRealDevice
- isInDevMode
- isOnExternalStorage

---

## Getting started

To start, import package

```dart
import 'package:palestine_trusted_device/palestine_trusted_device.dart';
```

---

## Usage

Ensure flutter framework is active

- Add this to the beginning of `main()`

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
    emulator: true,
    devMode: false,
    onExtStorage: false,
    rooted: false,
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

## Contributors

![Contributors](https://contrib.rocks/image?repo=palestinedevelopers/trusted_device)
