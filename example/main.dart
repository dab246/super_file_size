// Example for the super_file_size package.
// ----------------------------------------
// This example demonstrates how to convert raw byte values
// into human-readable file size strings.

import 'package:super_file_size/super_file_size.dart';

void main() {
  // Basic examples
  print(fileSize(512)); // 512 B
  print(fileSize(1536)); // 1.50 KB
  print(fileSize(1048576)); // 1 MB

  // Negative and fractional values
  print(fileSize(-2048)); // -2 KB
  print(fileSize(1.75 * 1024 * 1024)); // 1.75 MB

  // Using decimal system (1000-based) instead of binary (1024)
  print(fileSize(1500000, divider: 1000)); // 1.50 MB

  // Custom rounding precision
  print(fileSize(1536, round: 3)); // 1.500 KB

  // Handling string input
  print(fileSize('1048576')); // 1 MB

  // Very large size
  print(fileSize(1024 * 1024 * 1024 * 1024 * 5.2)); // 5.20 TB
}
