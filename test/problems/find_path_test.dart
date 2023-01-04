import 'package:flutter_test/flutter_test.dart';

import '../../problems/find-path-between-2-dots/find_path.dart';

void main() {
  group('Find path', () {
    test('Should return true', () {
      expect(
          isPath([
            [0, 0, 0, -1, 0],
            [-1, 0, 0, -1, -1],
            [0, 0, 0, -1, 0],
            [-1, 0, 0, 0, 0],
            [0, 0, -1, 0, 0]
          ]),
          true);
    });
    test('Should return false', () {
      expect(
          isPath([
            [0, 0, 0, -1, 0],
            [-1, 0, 0, -1, -1],
            [0, 0, 0, -1, 0],
            [-1, 0, 0, -1, 0],
            [0, 0, -1, 0, 0]
          ]),
          false);
    });
    test('Should return true', () {
      expect(
          isPath([
            [0, 0, 0, -1],
            [-1, -1, 0, -1],
            [0, 0, 0, 0],
          ]),
          true);
    });
  });
}
