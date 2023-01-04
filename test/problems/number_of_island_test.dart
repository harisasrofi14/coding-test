import 'package:flutter_test/flutter_test.dart';

import '../../problems/number-of-island/number_of_island.dart';

void main() {
  group('Number of island', () {
    test('Should return 4', () {
      expect(
          countIslands([
            [1, 1, 0, 0, 0],
            [0, 1, 0, 0, 1],
            [1, 0, 0, 1, 1],
            [0, 0, 0, 0, 0],
            [1, 0, 1, 1, 0]
          ]),
          4);
    });
    test('Should return 2', () {
      expect(
          countIslands([
            [1, 0, 0, 0, 0],
            [0, 1, 0, 0, 1],
            [0, 0, 0, 1, 1],
            [0, 0, 1, 1, 0]
          ]),
          2);
    });
    test('Should return 1 ', () {
      expect(
          countIslands([
            [0, 0, 0],
            [1, 1, 0],
            [0, 0, 1],
            [0, 1, 0]
          ]),
          1);
    });
  });
}
