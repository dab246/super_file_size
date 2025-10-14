import 'package:super_file_size/super_file_size.dart';
import 'package:test/test.dart';

void main() {
  group('fileSize - basic cases', () {
    test('less than divider', () {
      expect(fileSize(10), '10 B');
    });

    test('string input parsed correctly', () {
      expect(fileSize('10'), '10 B');
    });
  });

  group('fileSize - KB cases', () {
    test('exactly 1 KB', () {
      expect(fileSize(1024), '1 KB');
    });

    test('KB with decimals', () {
      expect(fileSize(1536), '1.50 KB');
    });
  });

  group('fileSize - MB cases', () {
    test('exactly 1 MB', () {
      expect(fileSize(1024 * 1024), '1 MB');
    });

    test('MB with decimals', () {
      expect(fileSize(1.5 * 1024 * 1024), '1.50 MB');
    });
  });

  group('fileSize - GB cases', () {
    test('exactly 1 GB', () {
      expect(fileSize(1024 * 1024 * 1024), '1 GB');
    });

    test('GB with decimals', () {
      expect(fileSize(1.25 * 1024 * 1024 * 1024), '1.25 GB');
    });
  });

  group('fileSize - TB cases', () {
    test('exactly 1 TB', () {
      expect(fileSize(1024 * 1024 * 1024 * 1024), '1 TB');
    });

    test('TB with decimals', () {
      expect(fileSize(1.5 * 1024 * 1024 * 1024 * 1024), '1.50 TB');
    });
  });

  group('fileSize - PB cases', () {
    test('exactly 1 PB', () {
      expect(fileSize(1024 * 1024 * 1024 * 1024 * 1024), '1 PB');
    });

    test('PB with decimals', () {
      expect(fileSize(1.75 * 1024 * 1024 * 1024 * 1024 * 1024), '1.75 PB');
    });
  });

  group('fileSize - large and fractional', () {
    test('>1 PB (EB range)', () {
      expect(fileSize(2.5 * 1024 * 1024 * 1024 * 1024 * 1024 * 1.1), '2.75 PB');
    });
  });

  group('fileSize - custom rounding', () {
    test('round = 0', () {
      expect(fileSize(1536, round: 0), '2 KB');
    });

    test('round = 3', () {
      expect(fileSize(1536, round: 3), '1.500 KB');
    });
  });

  group('fileSize - custom divider (1000-based)', () {
    test('decimal system 1 KB', () {
      expect(fileSize(1000, divider: 1000), '1 KB');
    });

    test('decimal system 1.5 MB', () {
      expect(fileSize(1.5 * 1000 * 1000, divider: 1000), '1.50 MB');
    });
  });

  group('fileSize - edge & invalid input', () {
    test('0 bytes', () {
      expect(fileSize(0), '0 B');
    });

    test('negative value', () {
      expect(fileSize(-1024), '-1 KB');
    });

    test('string invalid throws ArgumentError', () {
      expect(() => fileSize('abc'), throwsArgumentError);
    });

    test('null input throws ArgumentError', () {
      expect(() => fileSize(null), throwsArgumentError);
    });
  });
}
