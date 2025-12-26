int INF = 1 << 30;
late List<List<int>> memo;
late int n;

int minDifficulty(List<int> jobs, int d) {
  n = jobs.length;
  if (n < d) return -1;

  memo = List.generate(n, (_) => List.filled(d + 1, -1));
  return dfs(jobs, d, 0);
}

int dfs(List<int> jobs, int d, int start) {
  if (memo[start][d] != -1) {
    return memo[start][d];
  }

  if (d == 1) {
    int maxVal = 0;
    for (int i = start; i < n; i++) {
      if (jobs[i] > maxVal) maxVal = jobs[i];
    }
    memo[start][d] = maxVal;
    return maxVal;
  }

  int minCost = INF;
  int maxToday = 0;

  for (int i = start; i <= n - d; i++) {
    if (jobs[i] > maxToday) maxToday = jobs[i];
    int remaining = dfs(jobs, d - 1, i + 1);
    minCost = minCost < maxToday + remaining
        ? minCost
        : maxToday + remaining;
  }

  memo[start][d] = minCost;
  return minCost;
}
