import 'dart:core';
import 'dart:math';

isPath(var arr) {
  arr[0][0] = 1;
  var col = arr.length;
  var row = arr[0].length;

  for (int i = 1; i < row; i++) {
    if (arr[0][i] != -1) {
      arr[0][i] = arr[0][i - 1];
    }
  }

  for (int j = 1; j < col; j++) {
    if (arr[j][0] != -1) {
      arr[j][0] = arr[j - 1][0];
    }
  }

  for (int i = 1; i < col; i++) {
    for (int j = 1; j < row; j++) {
      if (arr[i][j] != -1) {
        arr[i][j] = max(num.parse(arr[i][j - 1].toString()),
            num.parse(arr[i - 1][j].toString()));
      }
    }
  }

  return arr[col - 1][row - 1] == 1 ? true : false;
}
