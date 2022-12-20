import 'dart:core';
import 'dart:math';

maxAreaOfIsland(var grid) {
  var col = grid.length;
  var row = grid[0].length;
  var ans = 0;
  int traversal(int i, int j, var grid) {
    if (i < 0 || j < 0 || i >= col || j >= row || grid[i][j] < 1) {
      return 0;
    }
    grid[i][j] = 0;
    return 1 +
        traversal(i - 1, j, grid) +
        traversal(i, j - 1, grid) +
        traversal(i + 1, j, grid) +
        traversal(i, j + 1, grid);
  }

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      if (grid[i][j] > 0) {
        ans = max(ans, traversal(i, j, grid));
      }
    }
  }

  return ans;
}
