countIslands(var M) {
  var col = M.length;
  var row = M[0].length;
  int count = 0;
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      if (M[i][j] == 1) {
        count++;
        dfs(M, i, j, row, col); // traversal starts from current cell
      }
    }
  }
  return count;
}

void dfs(var M, int i, int j, int row, int col) {
  if (i < 0 || j < 0 || i > (col - 1) || j > (row - 1) || M[i][j] != 1) {
    return;
  }
  if (M[i][j] == 1) {
    M[i][j] = 0;
    dfs(M, i + 1, j, row, col); // down side
    dfs(M, i - 1, j, row, col); // up side
    dfs(M, i, j + 1, row, col); // right side
    dfs(M, i, j - 1, row, col); // left side
    dfs(M, i + 1, j + 1, row, col); // upward-right side
    dfs(M, i - 1, j - 1, row, col); // downward-left side
    dfs(M, i + 1, j - 1, row, col); // downward-right side
    dfs(M, i - 1, j + 1, row, col); // upward-left side
  }
}
