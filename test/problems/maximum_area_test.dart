import 'package:flutter_test/flutter_test.dart';

import '../../problems/maximum-area-of-island/maximum_area.dart';

void main() {
  group('Max Area of island', () {
    test('Should return 6', () {
      expect(
          maxAreaOfIsland([
            [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
            [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
            [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]
          ]),
          6);
    });
    test('Should return 1', () {
      expect(
          maxAreaOfIsland([
            [0, 0, 0, 0],
            [0, 1, 0, 0],
            [0, 0, 1, 0]
          ]),
          1);
    });
    test('Should return 3', () {
      expect(
          maxAreaOfIsland([
            [0, 0, 0, 0],
            [1, 1, 0, 0],
            [0, 1, 0, 1]
          ]),
          3);
    });
  });
}
