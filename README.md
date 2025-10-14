# super_file_size

[![pub package](https://img.shields.io/pub/v/super_file_size.svg)](https://pub.dev/packages/super_file_size)
[![likes](https://img.shields.io/pub/likes/super_file_size)](https://pub.dev/packages/super_file_size/score)
[![popularity](https://img.shields.io/pub/popularity/super_file_size)](https://pub.dev/packages/super_file_size/score)
[![pub points](https://img.shields.io/pub/points/super_file_size)](https://pub.dev/packages/super_file_size/score)

A lightweight and flexible Dart package to **convert raw byte values into human-readable file sizes** (e.g. `1536 → 1.50 KB`).

---

## ✨ Features

- Supports `int`, `double`, and `String` inputs
- Handles **negative** and **fractional** values
- Works with **binary (1024)** and **decimal (1000)** dividers
- Customizable rounding precision
- Supports up to **exabytes (EB)**
- Simple, dependency-free, and pure Dart

---

## 📦 Installation

Add this line to your `pubspec.yaml`:

```yaml
dependencies:
  super_file_size: ^1.0.0


Inspired by [filesize.js](https://github.com/avoidwork/filesize.js "filesize.js")
