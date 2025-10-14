/// Returns a human-readable string representing a file size.
///
/// The [size] parameter can be a numeric value (`int`, `double`) or a
/// numeric string (e.g. `'1024'`).
///
/// The [round] parameter specifies the number of digits after the decimal
/// point when displaying fractional values (default: `2`).
///
/// The [divider] parameter defines the unit step used for conversion:
/// - `1024` for binary units (B, KB, MB, GB, ... — typical for computers)
/// - `1000` for decimal units (B, kB, MB, GB, ... — typical for disks)
///
/// This function automatically handles:
/// - negative values (e.g. `-1024` → `-1 KB`)
/// - fractional values (e.g. `1536` → `1.50 KB`)
/// - very large sizes up to exabytes (EB)
///
/// Example usage:
/// ```dart
/// print(fileSize(10)); // 10 B
/// print(fileSize(1536)); // 1.50 KB
/// print(fileSize(1048576)); // 1 MB
/// print(fileSize('1073741824')); // 1 GB
/// print(fileSize(-2048)); // -2 KB
/// print(fileSize(1500000, divider: 1000)); // 1.50 MB
/// ```
String fileSize(dynamic size, {int round = 2, double divider = 1024}) {
  num bytes;

  // Parse input
  if (size is num) {
    bytes = size;
  } else if (size is String) {
    try {
      bytes = num.parse(size);
    } catch (e) {
      throw ArgumentError('Cannot parse the size parameter: $e');
    }
  } else {
    throw ArgumentError('Unsupported size type: ${size.runtimeType}');
  }

  // Validate NaN
  if (bytes.isNaN) {
    throw ArgumentError('Size cannot be NaN');
  }

  // ✅ Track sign for negative values
  final isNegative = bytes < 0;
  bytes = bytes.abs();

  // Units list
  const units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'];

  var unitIndex = 0;

  // Determine the appropriate unit
  while (bytes >= divider && unitIndex < units.length - 1) {
    bytes /= divider;
    unitIndex++;
  }

  // Format number — show decimals only if needed
  final formatted = bytes.toStringAsFixed(bytes % 1 == 0 ? 0 : round);
  final result = '$formatted ${units[unitIndex]}';

  // ✅ Reapply negative sign if needed
  return isNegative ? '-$result' : result;
}
